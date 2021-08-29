defmodule Mylist do
  def map_sum(list, func) do
    _map_sum(list, 0, func)
  end

  defp _map_sum([], memo, _func) do
    memo
  end

  defp _map_sum([head | tail], memo, func) do
    _map_sum(tail, func.(head) + memo, func)
  end
end
