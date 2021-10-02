defmodule ControlFlow do
  def fizz_buzz_with_case(n) do
    case {rem(n, 3), rem(n, 5), n} do
      {0, 0, _} -> "FizzBuzz"
      {0, _, _} -> "Fizz"
      {_, 0, _} -> "Buzz"
      {_, _, n} -> n
    end
  end

  def fizz_buzz_with_cond(n) do
    cond do
      rem(n, 3) == 0 && rem(n, 5) == 0 ->
        "FizzBuzz"

      rem(n, 3) == 0 ->
        "Fizz"

      rem(n, 5) == 0 ->
        "Buzz"

      true ->
        n
    end
  end

  def fizz_buzz_with_func(n) do
    get_fizz_buzz_str = fn
      0, 0, _ -> "FizzBuzz"
      0, _, _ -> "Fizz"
      _, 0, _ -> "Buzz"
      _, _, a -> a
    end

    call_fizz_bazz = fn n -> get_fizz_buzz_str.(rem(n, 3), rem(n, 5), n) end
    call_fizz_bazz.(n)
  end

  def ok!(arg) do
    case arg do
      {:ok, b} -> b
      {:error, state} -> raise("error: " <> to_string(state))
      _ -> raise "unsupported params"
    end
  end
end
