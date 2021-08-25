defmodule Times do
  def double(i), do: i * 2
  def quadruple(i), do: double(i) * 2
end

Times.quadruple(3) |> IO.inspect()
