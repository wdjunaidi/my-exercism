defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    factor_map = [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]
    has_factors = Enum.map(factor_map, fn ({factor, word}) -> {rem(number, factor) == 0, word} end)
    if (in_set_factor(has_factors)) do
      rain_drop_sounds(has_factors)
    else
      Integer.to_string(number)
    end
  end

  @spec in_set_factor(list) :: boolean
  defp in_set_factor(data) do
    Enum.reduce(data, false, fn ({match, _}, acc) -> match || acc end)
  end

  defp rain_drop_sounds(data) do
    Enum.map_join(data, fn ({match, word}) -> if(match, do: word) end)
  end
end
