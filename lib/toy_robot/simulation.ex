defmodule ToyRobot.Simulation do
  defstruct [:grid, :robot]
  alias ToyRobot.{Robot, Simulation, Grid}

  @doc """
  Simulates the moves.

  ## Examples
      iex> alias ToyRobot.{Robot,Grid,Simulation}
      [ToyRobot.Robot,ToyRobot.Grid, ToyRobot.Simulation]
      iex> grid = %Grid{north_boundary: 4,east_boundary: 4}
      %Grid{north_boundary: 4,east_boundary: 4}
      iex> Simulation.place(grid, %{north: 0, east: 0, facing: "NORTH"})
      {
        :ok,
        %Simulation{
          grid: grid,
          robot: %Robot{north: 0, east: 0, facing: "NORTH"}
        }
      }
      iex> Simulation.place(grid, %{north: 6, east: 0, facing: "NORTH"})
      {:error, :invalid_placement}

  """

  def place(grid, placement) do
    if grid |> Grid.valid_position?(placement) do
      {
        :ok,
        %__MODULE__{
          grid: grid,
          robot: struct(Robot, placement)
        }
      }
    else
      {:error, :invalid_placement}
    end
  end

  @doc """
  Moves the robot forward one space in the direction that it is facing, unless that position is past the boundaries of the grid.
  ## Examples
  ### A valid movement

  iex> alias ToyRobot.{Robot, Grid, Simulation}
  [ToyRobot.Robot, ToyRobot.Grid, ToyRobot.Simulation]
  iex> grid = %Grid{north_boundary: 4, east_boundary: 4}
  %Grid{north_boundary: 4, east_boundary: 4}
  iex> simulation = %Simulation{
  ...>  grid: grid,
  ...>  robot: %Robot{north: 0, east: 0, facing: "NORTH"}
  ...> }
  iex> simulation |> Simulation.move
  {:ok, %Simulation{
    grid: grid,
    robot: %Robot{north: 1, east: 0, facing: "NORTH"}
  }}
  ### An invalid movement:

  iex> alias ToyRobot.{Robot, Grid, Simulation}
  [ToyRobot.Robot, ToyRobot.Grid, ToyRobot.Simulation]
  iex> grid = %Grid{north_boundary: 4, east_boundary: 4}
  %Grid{north_boundary: 4, east_boundary: 4}
  iex> simulation = %Simulation{
  ...>  grid: grid,
  ...>  robot: %Robot{north: 4, east: 0, facing: "NORTH"}
  ...> }
  iex> simulation |> Simulation.move
  {:error, :at_grid_boundary}
  """

  def move(%{robot: robot, grid: grid} = simulation) do
    moved_robot = robot |> Robot.move()

    grid
    |> Grid.valid_position?(moved_robot)
    |> if do
      {:ok, %{simulation | robot: moved_robot}}
    else
      {:error, :at_grid_boundary}
    end
  end

  @doc """
  Turns the robot left.
  ## Examples
  iex> alias ToyRobot.{Robot, Grid, Simulation}
  [ToyRobot.Robot, ToyRobot.Grid, ToyRobot.Simulation]
  iex> grid = %Grid{north_boundary: 4, east_boundary: 4}
  %Grid{north_boundary: 4, east_boundary: 4}
  iex> simulation = %Simulation{
  ...>  grid: grid,
  ...>  robot: %Robot{north: 0, east: 0, facing: "NORTH"}
  ...> }
  iex> simulation |> Simulation.turn_left
  {:ok, %Simulation{
    grid: grid,
    robot: %Robot{north: 0, east: 0, facing: "WEST"}
  }}
  """

  def turn_left(%{robot: robot} = simulation) do
    {:ok, %{simulation | robot: robot |> Robot.turn_left()}}
  end

  @doc """
  Turns the robot right.
  ## Examples

  iex> alias ToyRobot.{Robot, Grid, Simulation}
  [ToyRobot.Robot, ToyRobot.Grid, ToyRobot.Simulation]
  iex> grid = %Grid{north_boundary: 4, east_boundary: 4}
  %Grid{north_boundary: 4, east_boundary: 4}
  iex> simulation = %Simulation{
  ...>  grid: grid,
  ...>  robot: %Robot{north: 0, east: 0, facing: "NORTH"}
  ...> }
  iex> simulation |> Simulation.turn_right
  {:ok, %Simulation{
    grid: grid,
    robot: %Robot{north: 0, east: 0, facing: "EAST"}
  }}
  """
  def turn_right(%{robot: robot} = simulation) do
    {:ok, %{simulation | robot: robot |> Robot.turn_right()}}
  end

  @doc """
  Returns the robot's current position.
  ## Examples
  iex> alias ToyRobot.{Robot, Grid, Simulation}
  [ToyRobot.Robot, ToyRobot.Grid, ToyRobot.Simulation]
  iex> grid = %Grid{north_boundary: 5, east_boundary: 5}
  %Grid{north_boundary: 5, east_boundary: 5}
  iex> simulation = %Simulation{
  ...>  grid: grid,
  ...>  robot: %Robot{north: 0, east: 0, facing: "NORTH"}
  ...> }
  iex> simulation |> Simulation.report
  %Robot{north: 0, east: 0, facing: "NORTH"}
  """

  def report(%Simulation{robot: robot}), do: robot
end
