defmodule Chop do
  def guess(purpose, s..e) do
    list = Enum.to_list(s..e)
    currentValue = Enum.at(list, div(Enum.count(list) - 1, 2))
    # IO.inspect("Is it #{currentValue}")
    _guess(purpose, s..e, currentValue)
  end

  defp _guess(purpose, _, currentValue) when currentValue == purpose do
    # IO.inspect(currentValue)
  end

  defp _guess(purpose, _..e, currentValue) when currentValue < purpose do
    guess(purpose, (currentValue + 1)..e)
  end

  defp _guess(purpose, s.._, currentValue) when currentValue > purpose do
    guess(purpose, s..(currentValue - 1))
  end
end

Chop.guess(273, 1..1000)
