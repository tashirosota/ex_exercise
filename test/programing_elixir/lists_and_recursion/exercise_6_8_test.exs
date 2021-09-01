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

  test "span/2", do: assert(MyList2.span(3, 7) == [3, 4, 5, 6, 7])


  test "add_total_ammount/2" do
    tax_rates = [NC: 0.075, TX: 0.08]

    orders = [
      [id: 123, ship_to: :NC, net_amount: 100.00],
      [id: 124, ship_to: :OK, net_amount: 35.50],
      [id: 125, ship_to: :TX, net_amount: 24.00],
      [id: 126, ship_to: :TX, net_amount: 44.80],
      [id: 127, ship_to: :NC, net_amount: 25.00],
      [id: 128, ship_to: :MA, net_amount: 10.00],
      [id: 129, ship_to: :CA, net_amount: 102.00],
      [id: 130, ship_to: :NC, net_amount: 50.00]
    ]

    assert MyList2.add_total_ammount(tax_rates, orders) == [
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
