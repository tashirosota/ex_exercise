defmodule MyEnumTest do
  use ExUnit.Case
  doctest MyEnum

  test "all?" do
    assert(MyEnum.all?([true, false, true]) == false)
    assert(MyEnum.all?([true, true, true]) == true)
    assert(MyEnum.all?(["foo", "bar", "hello"], &(String.length(&1) == 3)) == false)
    assert(MyEnum.all?(["foo", "bar", "hello"], &(String.length(&1) > 1)) == true)
  end

  test ".each", do: assert(MyEnum.each([1, 2, 3, 4], &IO.inspect(&1)) == :ok)

  test ".filter", do: assert(MyEnum.filter([1, 2, 3, 4], &(rem(&1, 2) == 0)) == [2, 4])

  test "split/2" do
    assert MyEnum.split(1..3, 0) == {[], [1, 2, 3]}
    assert MyEnum.split(1..3, 1) == {[1], [2, 3]}
    assert MyEnum.split(1..3, 2) == {[1, 2], [3]}
    assert MyEnum.split(1..3, 3) == {[1, 2, 3], []}
    assert MyEnum.split(1..3, 4) == {[1, 2, 3], []}
    assert MyEnum.split(1..3, -1) == {[1, 2], [3]}
    assert MyEnum.split(1..3, -2) == {[1], [2, 3]}
    assert MyEnum.split(1..3, -3) == {[], [1, 2, 3]}
    assert MyEnum.split(1..3, -10) == {[], [1, 2, 3]}
    assert MyEnum.split(1..0, 3) == {[1, 0], []}
  end

  test "take/2" do
    assert MyEnum.take([1, 2, 3], 0) == []
    assert MyEnum.take([1, 2, 3], 1) == [1]
    assert MyEnum.take([1, 2, 3], 2) == [1, 2]
    assert MyEnum.take([1, 2, 3], 3) == [1, 2, 3]
    assert MyEnum.take([1, 2, 3], 4) == [1, 2, 3]
    assert MyEnum.take([1, 2, 3], -1) == [3]
    assert MyEnum.take([1, 2, 3], -2) == [2, 3]
    assert MyEnum.take([1, 2, 3], -4) == [1, 2, 3]
    assert MyEnum.take([], 3) == []
  end
end
