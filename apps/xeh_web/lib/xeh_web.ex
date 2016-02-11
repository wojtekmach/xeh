defmodule XehWeb do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    require Logger

    port = System.get_env("PORT") || 4000
    Logger.info("Starting cowboy on port #{port}")
    Plug.Adapters.Cowboy.http(XehWeb.App, [], port: port)

    children = [
      worker(XehWeb.Registry, [])
    ]

    opts = [strategy: :one_for_one, name: XehWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule XehWeb.App do
  import Plug.Conn
  alias XehWeb.Registry

  def init(options), do: options

  def call(conn, _opts) do
    packages = Registry.list

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(packages))
  end
end

defmodule XehWeb.Registry do
  def start_link do
    Agent.start_link(fn -> MapSet.new end, name: __MODULE__)
  end

  def clear do
    Agent.update(__MODULE__, fn _ -> MapSet.new end)
  end

  def list do
    Agent.get(__MODULE__, fn packages -> packages end) |> Enum.sort
  end

  def put(package) do
    Agent.update(__MODULE__, fn packages -> MapSet.put(packages, package) end)
  end
end
