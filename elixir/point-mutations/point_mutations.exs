defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(l1, l2) when length(l1) != length(l2), do: nil
  def hamming_distance([], []), do: 0
  def hamming_distance([h1|t1], [h2|t2]) when h1 == h2, do: hamming_distance(t1, t2)
  def hamming_distance([_|t1], [_|t2]), do: 1 + hamming_distance(t1, t2)

end
