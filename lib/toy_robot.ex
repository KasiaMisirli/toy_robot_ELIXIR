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
  def move(%__MODULE__{facing: "NORTH"} = robot), do: robot |> move_north
  def move(%__MODULE__{facing: "EAST"} = robot), do: robot |> move_east
  def move(%__MODULE__{facing: "SOUTH"} = robot), do: robot |> move_south
  def move(%__MODULE__{facing: "WEST"} = robot), do: robot |> move_west

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
  def move_east(robot) do
    %__MODULE__{east: robot.east + 1}
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
  def move_west(robot) do
    %__MODULE__{east: robot.east - 1}
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
  def move_north(robot) do
    %__MODULE__{north: robot.north + 1}
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
  def move_south(robot) do
    %__MODULE__{north: robot.north - 1}
  end
end
