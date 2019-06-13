defmodule ToyRobot.Robot do
  defstruct north: 0, east: 0, facing: "NORTH"
  alias ToyRobot.Robot

  @moduledoc """
  Documentation for ToyRobot.
  """

  @doc """
  Moves one space forward.

  ## Examples
      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{north: 0,facing: "NORTH"}
      %Robot{north: 0,facing: "NORTH"}
      iex> robot |> Robot.move |> Robot.move
      %Robot{north: 2}
  """

  def move(%__MODULE__{facing: facing} = robot) do
    case facing do
      "NORTH" -> robot |> move_north
      "EAST" -> robot |> move_east
      "SOUTH" -> robot |> move_south
      "WEST" -> robot |> move_west
    end
  end

  @doc """
  Moves one space forward.

  ## Examples
      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{east: 0}
      %Robot{east: 0}
      iex> robot |> Robot.move_east |> Robot.move_east
      %Robot{east: 2}
  """
  defp move_east(robot) do
    %Robot{east: robot.east + 1}
  end

  @doc """
  Moves one space forward.

  ## Examples

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{east: 0}
      %Robot{east: 0}
      iex> robot |> Robot.move_west |> Robot.move_west
      %Robot{east: -2}
  """
  defp move_west(robot) do
    %Robot{east: robot.east - 1}
  end

  @doc """
  Moves one space forward.

  ## Examples

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{north: 0}
      %Robot{north: 0}
      iex> robot |> Robot.move_north |> Robot.move_north
      %Robot{north: 2}
  """
  defp move_north(robot) do
    %Robot{north: robot.north + 1}
  end

  @doc """
  Moves one space forward.

  ## Examples

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{east: 0}
      %Robot{east: 0}
      iex> robot |> Robot.move_south |> Robot.move_south
      %Robot{north: -2}
  """
  defp move_south(robot) do
    %Robot{north: robot.north - 1}
  end

  @doc """
  Change facing.

  ## Examples

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{facing: "NORTH"}
      %Robot{facing: "NORTH"}
      iex> robot |> Robot.turn_left 
      %Robot{facing: "WEST"}
      iex> robot |> Robot.turn_left |> Robot.turn_left 
      %Robot{facing: "SOUTH"}
  """

  def turn_left(%Robot{facing: facing}) do
    case facing do
      "NORTH" -> %Robot{facing: "WEST"}
      "WEST" -> %Robot{facing: "SOUTH"}
      "EAST" -> %Robot{facing: "NORTH"}
      "SOUTH" -> %Robot{facing: "EAST"}
    end
  end

  @doc """
  Moves one space forward.

  ## Examples

      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{facing: "NORTH"}
      %Robot{facing: "NORTH"}
      iex> robot |> Robot.turn_right
      %Robot{facing: "EAST"}
      iex> robot |> Robot.turn_right|> Robot.turn_right
      %Robot{facing: "SOUTH"}
  """

  def turn_right(%Robot{facing: facing}) do
    case facing do
      "NORTH" -> %Robot{facing: "EAST"}
      "WEST" -> %Robot{facing: "NORTH"}
      "EAST" -> %Robot{facing: "SOUTH"}
      "SOUTH" -> %Robot{facing: "WEST"}
    end
  end
end
