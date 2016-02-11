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
    XehWeb.Registry.put("package 1")
    XehWeb.Registry.put("package 2")

    assert XehClient.list == ["package 1", "package 2"]
  end
end
