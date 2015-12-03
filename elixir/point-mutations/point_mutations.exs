defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(l1, l2), do: count_hamming_distance(l1, l2, 0)

  defp count_hamming_distance(l1, l2, acc) when length(l1) != length(l2), do: nil
  defp count_hamming_distance([], [], acc), do: acc
  defp count_hamming_distance([h|t1], [h|t2], acc), do: count_hamming_distance(t1, t2, acc)
  defp count_hamming_distance([_|t1], [_|t2], acc), do: count_hamming_distance(t1, t2, acc + 1)

end
