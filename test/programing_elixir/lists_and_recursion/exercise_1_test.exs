defmodule MylistTest do
  use ExUnit.Case
  doctest Mylist

  test "call to function for each element and reduce to 0" do
    # Mylist.map_sum([1, 2, 3], &(&1 * &1)) |> IO.inspect()
    assert Mylist.map_sum([1, 2, 3], &(&1 * &1)) == 14
  end
end
