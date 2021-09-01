defmodule MyList2Test do
  use ExUnit.Case
  doctest MyList2

  test "flatten/1" do
    assert MyList2.flatten([1, 2, 3]) == [1, 2, 3]
    assert MyList2.flatten([1, [2], 3]) == [1, 2, 3]
    assert MyList2.flatten([[1, [2], 3]]) == [1, 2, 3]
    assert MyList2.flatten([]) == []
    assert MyList2.flatten([[]]) == []
    assert MyList2.flatten([[], [[], []]]) == []
  end
end
