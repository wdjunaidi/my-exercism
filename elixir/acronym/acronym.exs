defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS":
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r{[\s-]}, trim: true)
    |> Enum.map(fn (elem) -> [String.capitalize(String.first(elem))] ++ [String.slice(elem, 1..-1)] end)
    |> List.flatten
    |> List.to_string
    |> (&(Regex.scan(~r/[A-Z]/, &1))).()
    |> List.to_string
  end
end
