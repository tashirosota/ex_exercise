defmodule MyStringTest do
  use ExUnit.Case
  doctest MyString

  test "only_asc2?/1" do
    assert(MyString.only_asc2?('test') == true)
    assert(MyString.only_asc2?('テスト') == false)
  end

  test "anagram?/2" do
    assert(MyString.anagram?("Tokyo", "kyoto") == true)
    assert(MyString.anagram?("li sten", "sile nt") == true)
    assert(MyString.anagram?("test", "clear") == false)
    assert(MyString.anagram?("cleara", "clearb") == false)
    assert(MyString.anagram?("", "") == true)
    assert(MyString.anagram?("", "a") == false)
  end

  test "calculate/1" do
    assert(MyString.calculate('124 + 27') == 151)
    assert(MyString.calculate('124 - 27') == 124 - 27)
    assert(MyString.calculate('3 / 2') == 1.5)
    assert(MyString.calculate('3 * 2') == 6)
  end
end
