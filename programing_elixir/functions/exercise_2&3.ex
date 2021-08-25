get_fizz_buzz_str = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

get_fizz_buzz_str.(0, 0, :a) |> IO.inspect()
get_fizz_buzz_str.(0, :b, :a) |> IO.inspect()
get_fizz_buzz_str.(:c, 0, :a) |> IO.inspect()
get_fizz_buzz_str.(:c, :b, :a) |> IO.inspect()

call_fizz_bazz = fn n -> get_fizz_buzz_str.(rem(n, 3), rem(n, 5), n) end

call_fizz_bazz.(1) |> IO.inspect()
call_fizz_bazz.(2) |> IO.inspect()
call_fizz_bazz.(3) |> IO.inspect()
call_fizz_bazz.(4) |> IO.inspect()
call_fizz_bazz.(5) |> IO.inspect()
call_fizz_bazz.(6) |> IO.inspect()
call_fizz_bazz.(7) |> IO.inspect()
call_fizz_bazz.(8) |> IO.inspect()
call_fizz_bazz.(9) |> IO.inspect()
call_fizz_bazz.(10) |> IO.inspect()
call_fizz_bazz.(11) |> IO.inspect()
call_fizz_bazz.(12) |> IO.inspect()
call_fizz_bazz.(13) |> IO.inspect()
call_fizz_bazz.(14) |> IO.inspect()
call_fizz_bazz.(15) |> IO.inspect()
call_fizz_bazz.(16) |> IO.inspect()
call_fizz_bazz.(17) |> IO.inspect()
