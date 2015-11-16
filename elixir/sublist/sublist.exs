defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      equal?(a, b)   -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true           -> :unequal 
    end
  end

  defp equal?(a, b), do: a === b

  defp sublist?(a, b) when length(a) >= length(b), do: false
  defp sublist?(a, b) do
    limit = length(a)
    range_end = length(b) - limit
    Enum.any?(0..range_end, fn x -> Enum.slice(b, x, limit) === a end)
  end
end
