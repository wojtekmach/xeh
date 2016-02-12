ExUnit.start()

defmodule Xeh.FakeClient do
  @moduledoc """
  A client with a simple in-memory storage useful for testing.
  """

  @behaviour XehClient.API

  def start_link do
    Agent.start_link(fn -> MapSet.new end, name: __MODULE__)
  end

  def clear do
    Agent.update(__MODULE__, fn _ -> MapSet.new end)
  end

  def list do
    Agent.get(__MODULE__, fn packages -> packages end) |> MapSet.to_list
  end

  def create(package) do
    Agent.update(__MODULE__, fn packages -> MapSet.put(packages, package) end)
  end
end

defmodule Xeh.IntegrationTestClient do
  @moduledoc """
  A client that spins up XehWeb and calls it through XehClient.
  Useful for end-to-end integration tests between Xeh and XehWeb.
  """

  @behaviour XehClient.API

  defdelegate list, to: XehClient
  defdelegate create(name), to: XehClient

  def start_link do
    XehWeb.start
  end

  def clear do
    XehWeb.Registry.clear
  end
end
