defmodule Xeh do
  def start do
    {:ok, _} = Application.ensure_all_started(:xeh)
  end
end
