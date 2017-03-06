defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """
  @alphabets MapSet.new(String.to_charlist("abcdefghijklmnopqrstuvwxyz"))

  @spec pangram?(String.t) :: boolean
  def pangram?(""), do: false

  def pangram?(sentence) do
    sentence
    |> normalize_sentence
    |> String.to_charlist
    |> MapSet.new
    |> MapSet.intersection(@alphabets)
    |> MapSet.equal?(@alphabets)
  end

  defp normalize_sentence(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/(?<=[\w\s])[\p{P}\$\^]+(?!\w+)/, "")
  end
end
