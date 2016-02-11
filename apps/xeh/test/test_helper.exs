ExUnit.start()

defmodule Xeh.FakeClient do
  @behaviour XehClient.API

  def list do
    []
  end
end
