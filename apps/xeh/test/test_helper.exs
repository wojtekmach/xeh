ExUnit.start()

defmodule Xeh.FakeClient do
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
