defmodule Teenager do
  def hey(input) do
    cond do
      question?(input) -> "Sure."
      empty?(input)    -> "Fine. Be that way!"
      all_cap?(input)  -> "Woah, chill out!"
      true             -> "Whatever."
    end
  end

  defp empty?(input) do
    String.strip(input) == ""
  end

  defp question?(input) do
    String.ends_with? input, "?"
  end

  defp all_cap?(input) do
    has_alphabet?(input) && String.upcase(input) == input 
  end

  defp has_alphabet?(input) do
    String.upcase(input) !== String.downcase(input)
  end

end
