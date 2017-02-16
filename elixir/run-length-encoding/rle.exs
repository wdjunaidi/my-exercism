defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(~r/(.)\1*/, string)
    |> Enum.map_join( fn([h|t]) -> Integer.to_string(String.length(h)) <> List.first(t) end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\w)/, string, capture: :all_but_first)
    |> Enum.map_join(&decode_char/1)
  end

  defp decode_char([h | t]) do
    {length, _} = Integer.parse(h)
    String.duplicate(List.first(t), length)
  end
end
