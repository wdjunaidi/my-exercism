defmodule Roman do

  @thousandth %{1000 => "M"}
  @hundredth %{9 => "CM", 5 => "D", 4 => "CD", 1 => "C"}
  @tenth %{9 => "XC", 5 => "L", 4 => "XL", 1 => "X"}
  @nth %{9 => "IX", 5 => "V", 4 => "IV", 1 => "I"}
  @scaled_map [{1000, @thousandth}, {100, @hundredth}, {10, @tenth}, {1, @nth}]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    scale_map = Enum.find(@scaled_map, fn({k,_}) -> div(number, k) >= 1 end)
    if(!is_nil(scale_map)) do
      translate(number, scale_map)
    else
      ""
    end
  end

  defp translate(number, {scale, map}) do
    case div(number, scale) do
      x when x >= 1 and scale == 1000 -> map[1000] <> numerals(number - 1000)
      x when x == 9 -> map[9] <> numerals(number - (9 * scale))
      x when x >= 5 -> map[5] <> numerals(number - (5 * scale))
      x when x == 4 -> map[4] <> numerals(number - (4 * scale))
      x when x >= 1 -> map[1] <> numerals(number - (1 * scale))
      _ -> numerals(number)
    end
  end

end
