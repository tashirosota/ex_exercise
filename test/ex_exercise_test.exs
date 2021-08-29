defmodule ExExerciseTest do
  use ExUnit.Case
  doctest ExExercise

  test "greets the world" do
    assert ExExercise.hello() == :world
  end
end
