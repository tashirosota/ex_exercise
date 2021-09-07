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

  test "center/1" do
    assert(MyString.center(["cat", "zebra", "elephant"]) == "  cat\n zebra\nelephant\n")
  end

  test "capitalize_sentence/1" do
    assert(MyString.capitalize_sentence("oh. a Dog. woof. ") == "Oh. A dog. Woof. ")
  end

  test "sales_tax/2" do
    tax_rates = [NC: 0.075, TX: 0.08]

    orders =
      "./sales.csv"
      |> Path.expand(__DIR__)
      |> File.stream!()
      |> CSV.decode!(headers: [:id, :ship_to, :net_amount])
      |> Enum.map(
        &if &1.id == "id" do
          nil
        else
          [
            id: String.to_integer(&1.id),
            ship_to: &1.ship_to |> String.replace(":", "") |> String.to_atom(),
            net_amount: String.to_float(&1.net_amount)
          ]
        end
      )
      |> Enum.reject(&is_nil(&1))

    assert MyString.sales_tax(tax_rates, orders) == [
             [id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 107.5],
             [id: 124, ship_to: :OK, net_amount: 35.5],
             [id: 125, ship_to: :TX, net_amount: 24.0, total_amount: 25.92],
             [id: 126, ship_to: :TX, net_amount: 44.8, total_amount: 48.384],
             [id: 127, ship_to: :NC, net_amount: 25.0, total_amount: 26.875],
             [id: 128, ship_to: :MA, net_amount: 10.0],
             [id: 129, ship_to: :CA, net_amount: 102.0],
             [id: 130, ship_to: :NC, net_amount: 50.0, total_amount: 53.75]
           ]
  end
end
