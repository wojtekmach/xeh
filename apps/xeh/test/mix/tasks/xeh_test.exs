defmodule Mix.Tasks.Hex.SearchTest do
  use ExUnit.Case

  setup do
    Mix.shell(Mix.Shell.Process)
    :ok
  end

  test "list all packages" do
    Mix.Tasks.Xeh.run([])
    assert_received {:mix_shell, :info, ["No packages."]}
  end
end
