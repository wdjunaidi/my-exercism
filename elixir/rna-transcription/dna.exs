defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna([]), do: []
  def to_rna([head|tail]) do
    [ transcribe(head) | to_rna(tail) ]
  end

  defp transcribe(?G), do: ?C
  defp transcribe(?A), do: ?U
  defp transcribe(?C), do: ?G
  defp transcribe(?T), do: ?A
end
