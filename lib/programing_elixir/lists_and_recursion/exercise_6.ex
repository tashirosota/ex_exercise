defmodule MyList2 do
  def flatten(list) do
    flatten(list, [])
  end

  defp flatten([], memo), do: memo

  defp flatten([head | tail], memo) do
    if is_list(head) do
      memo ++ flatten(head) ++ flatten(tail)
    else
      flatten(tail, memo ++ [head])
    end
  end

  def add_total_ammount(tax_rates, orders) do
    for order <- orders do
      tax_key = Keyword.get(order, :ship_to)

      if rate = Keyword.get(tax_rates, tax_key) do
        net_amount = Keyword.get(order, :net_amount)
        order ++ [total_amount: net_amount + net_amount * rate]
      else
        order
      end
    end
  end

  def span(from, to) do
    for el <- from..to, do: el
  end
end
