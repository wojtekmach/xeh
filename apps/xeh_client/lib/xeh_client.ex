defmodule XehClient do
  defmodule API do
    @doc "Returns list of Xeh packages"
    @callback list :: [String.t]

    @doc "Creates a Xeh package"
    @callback create(String.t) :: :ok
  end

  @behaviour API

  def list do
    HTTPoison.get!("http://localhost:4000").body |> Poison.decode!
  end

  def create(package) do
    %HTTPoison.Response{status_code: 200} = HTTPoison.post!("http://localhost:4000", package)
    :ok
  end
end
