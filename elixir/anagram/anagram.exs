defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    dbase = String.downcase(base)
    Enum.filter(candidates, fn x -> anagram?(String.downcase(x), dbase) end)    
  end

  defp anagram?(a, b) when length(a) != length(b), do: false
  defp anagram?(a, b) do
    if a == b do
      false
    else 
      transform_word(a) == transform_word(b)
    end
  end
  
  defp transform_word(word) do
    word
    |> String.to_char_list
    |> Enum.sort
  end

end
