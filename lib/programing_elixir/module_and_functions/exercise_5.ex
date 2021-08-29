defmodule Gdable do
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

Gdable.gcd(10, 15) # |> IO.inspect()
