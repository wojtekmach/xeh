defmodule XehWeb do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    require Logger

    port = System.get_env("PORT") || 4000
    Logger.info("Starting cowboy on port #{port}")
    Plug.Adapters.Cowboy.http(XehWeb.App, [], port: port)

    children = []

    opts = [strategy: :one_for_one, name: XehWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule XehWeb.App do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    packages = []

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(packages))
  end
end
