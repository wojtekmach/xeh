defmodule XehWebTest do
  use ExUnit.Case
  use Plug.Test

  test "list packages: none" do
    assert XehClient.list == []
  end
end
