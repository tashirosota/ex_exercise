defmodule MyString do
  def only_asc2?(char_list) do
    Enum.all?(char_list, &(&1 <= 127))
  end

  def anagram?(word1, word2) do
    word1_char_list = word1 |> String.downcase() |> String.to_charlist()
    word2_char_list = word2 |> String.downcase() |> String.to_charlist()

    if Enum.count(word1_char_list) == Enum.count(word2_char_list),
      do: _anagram?(word1_char_list, word2_char_list),
      else: false
  end

  defp _anagram?([], []), do: true

  defp _anagram?([word1_head | word1_tail], word2_char_list) do
    word2_char_list_without_word1_head = word2_char_list -- [word1_head]

    if Enum.count(word1_tail) == Enum.count(word2_char_list_without_word1_head),
      do: _anagram?(word1_tail, word2_char_list_without_word1_head),
      else: false
  end

  @spec calculate(any) :: number
  def calculate(str_func) do
    [first, second, last] = str_func |> to_string() |> String.split
    case second do
     "*" -> String.to_integer(first) * String.to_integer(last)
     "/" -> String.to_integer(first) / String.to_integer(last)
     "-" -> String.to_integer(first) - String.to_integer(last)
     "+" -> String.to_integer(first) + String.to_integer(last)
    end
  end
end
