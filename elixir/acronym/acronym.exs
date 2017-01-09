defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS":
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r{[\s-]}, trim: true)
    |> Enum.map_join(&(String.capitalize(&1)))
    |> String.to_charlist
    |> Enum.reduce(fn (ch, acc) -> if (is_upcase(ch) end)
  end

  defp is_upcase(char) do
    String.upcase(char) == char
  end
end
