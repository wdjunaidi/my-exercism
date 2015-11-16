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

  defp transcribe(char) when char == 71, do: 67
  defp transcribe(char) when char == 67, do: 71
  defp transcribe(char) when char == 84, do: 65
  defp transcribe(char) when char == 65, do: 85
end
