defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    cond do
      number >= 1000 -> "M" <> numerals(number - 1000)
      div(number, 100) == 9 -> "CM" <> numerals(number - 900)
      div(number, 100) >= 5 -> "D" <> numerals(number - 500)
      div(number, 100) == 4 -> "CD" <> numerals(number - 400)
      div(number, 100) >= 1 -> "C" <> numerals(number - 100)
      div(number, 10) == 9 -> "XC" <> numerals(number - 90)
      div(number, 10) >= 5 -> "L" <> numerals(number - 50)
      div(number, 10) == 4 -> "XL" <> numerals(number - 40)
      div(number, 10) >= 1 -> "X" <> numerals(number - 10)
      div(number, 1) == 9 -> "IX" <> numerals(number - 9)
      div(number, 1) >= 5 -> "V" <> numerals(number - 5)
      div(number, 1) == 4 -> "IV" <> numerals(number - 4)
      div(number, 1) >= 1 -> "I" <> numerals(number - 1)
      true -> ""
    end
  end

end
