defmodule Roman do

  @hundredth %{9 => "CM", 5 => "D", 4 => "CD", 1 => "C"}
  @tenth %{9 => "XC", 5 => "L", 4 => "XL", 1 => "X"}
  @nth %{9 => "IX", 5 => "V", 4 => "IV", 1 => "I"}

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    cond do
      number >= 1000        -> "M" <> numerals(number - 1000)
      div(number, 100) >= 1 -> translate(number, 100, @hundredth)
      div(number,  10) >= 1 -> translate(number,  10, @tenth)
      div(number,   1) >= 1 -> translate(number,   1, @nth)
      true -> ""
    end
  end

  defp translate(number, scale, convertmap) do
    cond do
      div(number, scale) == 9 -> convertmap[9] <> numerals(number - (9 * scale))
      div(number, scale) >= 5 -> convertmap[5] <> numerals(number - (5 * scale))
      div(number, scale) == 4 -> convertmap[4] <> numerals(number - (4 * scale))
      div(number, scale) >= 1 -> convertmap[1] <> numerals(number - (1 * scale))
      true -> numerals(number)
    end
  end

end
