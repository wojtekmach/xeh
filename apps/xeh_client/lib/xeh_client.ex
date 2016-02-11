defmodule XehClient do
  defmodule API do
    @doc "Returns list of Xeh packages"
    @callback list :: [String.t]
  end

  @behaviour API

  def list do
    HTTPoison.get!("http://localhost:4000").body |> Poison.decode!
  end
end
