defmodule Mix.Tasks.Xeh do
  use Mix.Task

  @xeh_client Application.get_env(:xeh, :xeh_client)

  @moduledoc """
  Lists all Xeh packages
  """
  def run(_) do
    Xeh.start

    case @xeh_client.list do
      [] ->
        Mix.shell.info "No packages."

      packages ->
        for package <- packages do
          Mix.shell.info package
        end
    end
  end

  defmodule Create do
    use Mix.Task

    @xeh_client Application.get_env(:xeh, :xeh_client)

    @moduledoc """
    Creates a new package
    """
    def run([name]) do
      Xeh.start

      @xeh_client.create(name)
      Mix.shell.info "Created package #{name}"
    end
  end
end
