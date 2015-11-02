defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> normalize_sentence
    |> String.split
    |> Enum.reduce %{}, &word_count/2
  end

  defp normalize_sentence(sentence) do
    sentence
    |> String.downcase
    |> String.replace("_", " ")
    |> String.replace(~r/(?<=[\w\s])[\p{P}\$\^]+(?!\w+)/, "")
  end

  defp word_count(word, acc) do
    Map.update(acc, word, 1, &(&1 + 1))
  end

end
