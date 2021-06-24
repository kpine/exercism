defmodule SecretHandshake do
  use Bitwise

  @reverse_bit 0b10000
  @handshake_code [{0b1000, "jump"}, {0b100, "close your eyes"}, {0b10, "double blink"}, {0b1, "wink"}]

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
    actions = Enum.reduce(@handshake_code, [], fn {bit, action}, actions ->
      case code &&& bit do
        0 -> actions
        _ -> [ action | actions ]
      end
    end)

    case code &&& @reverse_bit do
      0 -> actions
      _ -> Enum.reverse(actions)
    end
  end
end
