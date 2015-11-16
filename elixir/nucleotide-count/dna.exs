defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    nucleotide_counts(strand)[nucleotide] || 0
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    Enum.reduce(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0}, &increment_count/2)
  end

  defp increment_count(char, acc) do
    Map.update(acc, char, 1, &(&1 + 1))
  end
end
