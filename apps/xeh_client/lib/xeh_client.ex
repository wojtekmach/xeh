defmodule XehClient do
  defmodule API do
    @doc "Returns list of Xeh packages"
    @callback list :: [String.t]
  end

  @behaviour API

  def list do
    []
  end
end
