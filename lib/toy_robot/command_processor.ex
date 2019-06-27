defmodule ToyRobot.CommandProcessor do
  @doc """
  Processes commands from a commands list, in preparation for handling them.

  ## Examples

      iex> alias ToyRobot.CommandProcessor
      ToyRobot.CommandProcessor
      iex> commands = ["PLACE 1,2,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
      ["PLACE 1,2,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
      iex> commands |> CommandProcessor.process()
      [
        {:place, %{north: 2, east: 1, facing: :north}},
        :move,
        :turn_left,
        :turn_right,
        :report,
      ]
  """
  def process(commands) do
    commands |> Enum.map(&do_process/1)
  end

  defp do_process(("PLACE" <> _rest) = command) do
    format = ~r/\APLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST)\z/
    case Regex.run(format, command) do
      [_command, east, north, facing] ->
        to_integer = &String.to_integer/1

        {:place, %{
          east: to_integer.(east),
          north: to_integer.(north),
          facing: facing |> String.downcase |> String.to_atom
        }}
      nil -> {:invalid, command}
    end
  end

  defp do_process("MOVE"), do: :move
  defp do_process("LEFT"), do: :turn_left
  defp do_process("RIGHT"), do: :turn_right
  defp do_process("REPORT"), do: :report
  defp do_process(command), do: {:invalid, command}
end
