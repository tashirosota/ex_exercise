defmodule MylistTest do
  use ExUnit.Case
  doctest Mylist

  test ".map_sum", do: assert(Mylist.map_sum([1, 2, 3], &(&1 * &1)) == 14)

  test ".max", do: assert(Mylist.max([1, 4, 3, 2]) == 4)

  test ".caesar", do: assert(Mylist.caesar('ryvkve', 13) == 'elixir')
end
