defmodule Mix.Tasks.Xeh do
  use Mix.Task

  @xeh_client Application.get_env(:xeh, :xeh_client)

  @moduledoc """
  Lists all Xeh packages
  """
  def run(_) do
    case @xeh_client.list do
      [] ->
        Mix.shell.info "No packages."
    end
  end
end
