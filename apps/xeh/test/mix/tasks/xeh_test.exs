defmodule Mix.Tasks.Hex.SearchTest do
  use ExUnit.Case

  @xeh_client Xeh.FakeClient

  setup_all do
    @xeh_client.start_link
    :ok
  end

  setup do
    Mix.shell(Mix.Shell.Process)
    @xeh_client.clear
    :ok
  end

  test "list packages: none" do
    Mix.Tasks.Xeh.run([])
    assert_received {:mix_shell, :info, ["No packages."]}
  end

  test "list packages: all" do
    @xeh_client.put("foo")
    @xeh_client.put("bar")
    Mix.Tasks.Xeh.run([])
    assert_received {:mix_shell, :info, ["foo"]}
    assert_received {:mix_shell, :info, ["bar"]}
  end
end
