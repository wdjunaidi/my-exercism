defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @factor_map [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    @factor_map
    |> Enum.map_join(fn({k, v}) -> rain_drop_sound(number, k, v) end)
    |> rain_drop_sounds(number)
  end

  defp rain_drop_sound(number, factor, sound) do
    if(rem(number, factor) == 0, do: sound, else: "")
  end

  defp rain_drop_sounds("", number) do
    Integer.to_string(number)
  end

  defp rain_drop_sounds(sounds, _) do
    sounds
  end
end
