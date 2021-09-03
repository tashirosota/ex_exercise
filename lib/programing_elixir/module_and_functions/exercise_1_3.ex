defmodule Times do
  def double(i), do: i * 2
  def triple(i), do: i * 3
  def quadruple(i), do: double(i) * 2
end

Times.triple(3) # |> IO.inspect()
