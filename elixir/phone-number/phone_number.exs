defmodule Phone do
  @bad_number "0000000000"

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    number = sanitize(raw)

    cond do
      local_phone?(number)    -> number
      intl_usa_phone?(number) -> String.slice(number, 1..-1)
      true                    -> @bad_number
    end
  end

  defp local_phone?(number) do
    String.length(number) == 10
  end

  defp intl_usa_phone?(number) do
    String.length(number) == 11 && String.first(number) == "1"
  end

  defp sanitize(raw) do
    raw 
    |> String.replace(~r/[.-\s)(]/, "")
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    { area_code, _, _ } = split_phone(raw)
    area_code
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    { area_code, front, back } = split_phone(raw)
    "(" <> area_code <> ") " <> front <> "-" <> back
  end

  defp split_phone(raw) do
    phone = number(raw)
    { String.slice(phone, 0..2), String.slice(phone, 3..5), String.slice(phone, 6..-1) }
  end
end
