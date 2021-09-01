defmodule MyEnum do
  def all?([]), do: true

  def all?([head | tail]) do
    if head, do: all?(tail), else: false
  end

  @spec all?(maybe_improper_list, any) :: boolean
  def all?([], _fun), do: true

  def all?([head | tail], fun) do
    if fun.(head), do: all?(tail, fun), else: false
  end

  def each([], _fun), do: :ok

  def each([head | tail], fun) do
    head |> fun.()
    each(tail, fun)
  end

  def filter(enumeable, func) do
    filter(enumeable, func, [])
  end

  defp filter([], _func, memo), do: memo

  defp filter([head | tail], func, memo) do
    new_memo = if func.(head), do: memo ++ [head], else: memo
    filter(tail, func, new_memo)
  end

  def split(enumeable, num) when num < 0 do
    {first, last} =
      split(
        enumeable |> Enum.to_list() |> Enum.reverse(),
        [],
        num * -1
      )

    {last |> Enum.reverse(), first |> Enum.reverse()}
  end

  def split(enumeable, num) do
    split(Enum.to_list(enumeable), [], num)
  end

  defp split([], memo, _num) do
    {memo, []}
  end

  defp split([head | tail], memo, num) do
    if num <= Enum.count(memo) do
      {memo, [head] ++ tail}
    else
      split(tail, memo ++ [head], num)
    end
  end

  @spec take(any, any) :: list
  def take(enumeable, num) when num < 0 do
    take(enumeable |> Enum.reverse(), [], num * -1) |> Enum.reverse()
  end

  def take(enumeable, num) do
    take(enumeable, [], num)
  end

  defp take([], memo, _num), do: memo

  defp take([head | tail], memo, num) do
    if num <= Enum.count(memo) do
      memo
    else
      take(tail, memo ++ [head], num)
    end
  end
end
