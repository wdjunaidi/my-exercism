defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(l1, l2) when length(l1) != length(l2), do: nil
  def hamming_distance(l1, l2) do
    Enum.zip(l1, l2)
    |> Enum.count(fn({n, n}) -> false; (_) -> true end)
  end

end
