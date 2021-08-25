defmodule Sumable do
  def sum(0), do: 0
  def sum(i), do: i + sum(i - 1)
end

Sumable.sum(10) |> IO.inspect()
