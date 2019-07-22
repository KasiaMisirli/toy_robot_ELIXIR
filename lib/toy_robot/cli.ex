defmodule ToyRobot.CLI do
  defstruct(north: 0, east: 0, facing: "NORTH")
  alias ToyRobot.Robot

  def main([filename]) do
    if File.exists?(filename) do
      filename
      |> read_commands
      |> run_commands
    else
      IO.puts("#{filename} does not exist")
    end
  end

  defp read_commands(filename) do
    File.stream!(filename)
    |> Enum.to_list()
    |> Enum.map(&String.trim/1)

    # |> ToyRobot.CommandProcessor
  end

  # run_commands/1
  defp run_commands(commands) do
    # run_commands/2
    run_commands(commands, %{position: 0, facing: "NORTH"})
  end

  # def run_commands([command | commands], robot) do
  #   case command do
  #     "MOVE" -> run_commands(commands, robot |> ToyRobot.move())
  #     "LEFT" -> run_commands(commands, robot |> ToyRobot.left())
  #     "RIGHT" -> run_commands(commands, robot |> ToyRobot.right())
  #     "REPORT" -> run_commands(commands, robot |> ToyRobot.report())
  #     "" -> nil
  #   end
  # end

  def run_commands(["MOVE" | commands], robot) do
    run_commands(commands, robot |> Robot.move())
  end

  def run_commands(["LEFT" | commands], robot) do
    run_commands(commands, robot |> Robot.move_west())
  end

  # def run_commands(["east" | commands], robot) do
  #   run_commands(commands, robot |> Robot.move_east())
  # end

  # def run_commands(["north" | commands], robot) do
  #   run_commands(commands, robot |> Robot.move_north())
  # end

  def run_commands([], %{position: position}, %{facing: facing}) do
    IO.puts("Robot is at position #{position} and its facing #{facing}")
  end
end
