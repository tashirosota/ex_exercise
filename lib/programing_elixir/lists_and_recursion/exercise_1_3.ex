defmodule Mylist do
  def map_sum(list, func), do: _map_sum(list, 0, func)
  defp _map_sum([], memo, _func), do: memo
  defp _map_sum([head | tail], memo, func), do: _map_sum(tail, func.(head) + memo, func)

  def max([current | tail]), do: _max(tail, current)
  def _max([], current), do: current

  def _max([head | tail], current) do
    if head > current, do: _max(tail, head), else: _max(tail, current)
  end

  def caesar(list, num), do: Enum.map(list, &_caesar(&1, num))
  defp _caesar(char, num) when char + num > 122, do: char + num - 26
  defp _caesar(char, num) when char + num < 122, do: char + num
end
