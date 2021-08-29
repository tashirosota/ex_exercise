list_concat = &Enum.concat(&1, &2)
list_concat.([:a, :b], [:a, :b]) # |> IO.inspect()

sum = &(&1 + &2 + &3)
sum.(1, 2, 3) # |> IO.inspect()

pair_tuple_to_list = &Tuple.to_list(&1)
pair_tuple_to_list.({1234, 5678}) # |> IO.inspect()
