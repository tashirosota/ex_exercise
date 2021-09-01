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
end
