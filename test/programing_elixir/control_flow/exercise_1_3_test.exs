defmodule ControlFlowTest do
  use ExUnit.Case
  doctest ControlFlow

  test ".fizz_buzz_with_case" do
    assert(ControlFlow.fizz_buzz_with_case(1) == ControlFlow.fizz_buzz_with_cond(1))
    assert(ControlFlow.fizz_buzz_with_case(2) == ControlFlow.fizz_buzz_with_cond(2))
    assert(ControlFlow.fizz_buzz_with_case(3) == ControlFlow.fizz_buzz_with_cond(3))
    assert(ControlFlow.fizz_buzz_with_case(4) == ControlFlow.fizz_buzz_with_cond(4))
    assert(ControlFlow.fizz_buzz_with_case(5) == ControlFlow.fizz_buzz_with_cond(5))
    assert(ControlFlow.fizz_buzz_with_case(6) == ControlFlow.fizz_buzz_with_cond(6))
    assert(ControlFlow.fizz_buzz_with_case(7) == ControlFlow.fizz_buzz_with_cond(7))
    assert(ControlFlow.fizz_buzz_with_case(8) == ControlFlow.fizz_buzz_with_cond(8))
    assert(ControlFlow.fizz_buzz_with_case(9) == ControlFlow.fizz_buzz_with_cond(9))
    assert(ControlFlow.fizz_buzz_with_case(10) == ControlFlow.fizz_buzz_with_cond(10))
    assert(ControlFlow.fizz_buzz_with_case(11) == ControlFlow.fizz_buzz_with_cond(11))
    assert(ControlFlow.fizz_buzz_with_case(12) == ControlFlow.fizz_buzz_with_cond(12))
    assert(ControlFlow.fizz_buzz_with_case(13) == ControlFlow.fizz_buzz_with_cond(13))
    assert(ControlFlow.fizz_buzz_with_case(14) == ControlFlow.fizz_buzz_with_cond(14))
    assert(ControlFlow.fizz_buzz_with_case(15) == ControlFlow.fizz_buzz_with_cond(15))
    assert(ControlFlow.fizz_buzz_with_case(16) == ControlFlow.fizz_buzz_with_cond(16))
    assert(ControlFlow.fizz_buzz_with_case(17) == ControlFlow.fizz_buzz_with_cond(17))
  end

  test ".fizz_buzz_with_cond" do
    assert(ControlFlow.fizz_buzz_with_cond(1) == ControlFlow.fizz_buzz_with_func(1))
    assert(ControlFlow.fizz_buzz_with_cond(2) == ControlFlow.fizz_buzz_with_func(2))
    assert(ControlFlow.fizz_buzz_with_cond(3) == ControlFlow.fizz_buzz_with_func(3))
    assert(ControlFlow.fizz_buzz_with_cond(4) == ControlFlow.fizz_buzz_with_func(4))
    assert(ControlFlow.fizz_buzz_with_cond(5) == ControlFlow.fizz_buzz_with_func(5))
    assert(ControlFlow.fizz_buzz_with_cond(6) == ControlFlow.fizz_buzz_with_func(6))
    assert(ControlFlow.fizz_buzz_with_cond(7) == ControlFlow.fizz_buzz_with_func(7))
    assert(ControlFlow.fizz_buzz_with_cond(8) == ControlFlow.fizz_buzz_with_func(8))
    assert(ControlFlow.fizz_buzz_with_cond(9) == ControlFlow.fizz_buzz_with_func(9))
    assert(ControlFlow.fizz_buzz_with_cond(10) == ControlFlow.fizz_buzz_with_func(10))
    assert(ControlFlow.fizz_buzz_with_cond(11) == ControlFlow.fizz_buzz_with_func(11))
    assert(ControlFlow.fizz_buzz_with_cond(12) == ControlFlow.fizz_buzz_with_func(12))
    assert(ControlFlow.fizz_buzz_with_cond(13) == ControlFlow.fizz_buzz_with_func(13))
    assert(ControlFlow.fizz_buzz_with_cond(14) == ControlFlow.fizz_buzz_with_func(14))
    assert(ControlFlow.fizz_buzz_with_cond(15) == ControlFlow.fizz_buzz_with_func(15))
    assert(ControlFlow.fizz_buzz_with_cond(16) == ControlFlow.fizz_buzz_with_func(16))
    assert(ControlFlow.fizz_buzz_with_cond(17) == ControlFlow.fizz_buzz_with_func(17))
  end

  test ".fizz_buzz_with_func" do
    assert(ControlFlow.fizz_buzz_with_func(1) == ControlFlow.fizz_buzz_with_case(1))
    assert(ControlFlow.fizz_buzz_with_func(2) == ControlFlow.fizz_buzz_with_case(2))
    assert(ControlFlow.fizz_buzz_with_func(3) == ControlFlow.fizz_buzz_with_case(3))
    assert(ControlFlow.fizz_buzz_with_func(4) == ControlFlow.fizz_buzz_with_case(4))
    assert(ControlFlow.fizz_buzz_with_func(5) == ControlFlow.fizz_buzz_with_case(5))
    assert(ControlFlow.fizz_buzz_with_func(6) == ControlFlow.fizz_buzz_with_case(6))
    assert(ControlFlow.fizz_buzz_with_func(7) == ControlFlow.fizz_buzz_with_case(7))
    assert(ControlFlow.fizz_buzz_with_func(8) == ControlFlow.fizz_buzz_with_case(8))
    assert(ControlFlow.fizz_buzz_with_func(9) == ControlFlow.fizz_buzz_with_case(9))
    assert(ControlFlow.fizz_buzz_with_func(10) == ControlFlow.fizz_buzz_with_case(10))
    assert(ControlFlow.fizz_buzz_with_func(11) == ControlFlow.fizz_buzz_with_case(11))
    assert(ControlFlow.fizz_buzz_with_func(12) == ControlFlow.fizz_buzz_with_case(12))
    assert(ControlFlow.fizz_buzz_with_func(13) == ControlFlow.fizz_buzz_with_case(13))
    assert(ControlFlow.fizz_buzz_with_func(14) == ControlFlow.fizz_buzz_with_case(14))
    assert(ControlFlow.fizz_buzz_with_func(15) == ControlFlow.fizz_buzz_with_case(15))
    assert(ControlFlow.fizz_buzz_with_func(16) == ControlFlow.fizz_buzz_with_case(16))
    assert(ControlFlow.fizz_buzz_with_func(17) == ControlFlow.fizz_buzz_with_case(17))
  end

  test ".ok!" do
    assert_raise RuntimeError, fn ->
      ControlFlow.ok!("raise_error" |> Path.expand(__DIR__) |> File.open())
    end

    assert(
      "somefile.txt" |> Path.expand(__DIR__) |> File.open() |> ControlFlow.ok!() |> is_pid() ==
        true
    )
  end
end
