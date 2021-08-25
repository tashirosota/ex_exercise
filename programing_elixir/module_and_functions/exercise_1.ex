defmodule Times do
  def triple(i), do: i * 3
end

Times.triple(3) |> IO.inspect()
