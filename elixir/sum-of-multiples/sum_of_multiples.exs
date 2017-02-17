defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.map(factors, fn factor -> factorized(factor, limit, factor) end)
    |> List.flatten
    |> Enum.sort
    |> Enum.dedup
    |> List.foldl(0, &(&1 + &2))
  end

  def factorized(factor, limit, acc) when acc < limit do
    [acc | factorized(factor, limit, factor + acc)]
  end
  def factorized(_, _, _), do: []

end
