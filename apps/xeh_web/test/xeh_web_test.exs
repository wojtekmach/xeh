defmodule XehWebTest do
  use ExUnit.Case, async: false
  use Plug.Test

  setup do
    XehWeb.Registry.clear
    :ok
  end

  test "list packages: none" do
    assert XehClient.list == []
  end

  test "list packages: all" do
    XehClient.create("package 1")
    XehClient.create("package 2")

    assert XehClient.list == ["package 1", "package 2"]
  end

  test "create package is idempotent" do
    XehClient.create("package 1")
    XehClient.create("package 1")

    assert XehClient.list == ["package 1"]
  end
end
