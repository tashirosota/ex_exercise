defmodule MyEnum do
  def all?([]), do: true
  def all?([head | tail]) do
    if head, do: all?(tail), else: false
  end

  def all?([], _fun), do: true
  def all?([head | tail], fun) do
    if fun.(head), do: all?(tail), else: false
  end

  def each([], _fun), do: nil
  def each([head | tail], fun) do
    head |> fun.call()
    each(tail, fun)
  end
end
