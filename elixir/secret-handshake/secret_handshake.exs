defmodule SecretHandshake do
  use Bitwise, only_operators: true

  @decoder %{8 => "jump", 4 => "close your eyes", 2 => "double blink", 1 => "wink" }

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    result = @decoder
      |> Enum.map(fn({k,v}) -> if((k &&& code) == k, do: v) end)
      |> Enum.filter(&(!is_nil(&1)))

    if ((code &&& 16) == 16) do
      Enum.reverse(result)
    else
      result
    end
  end

end
