defmodule ToyRobot.CommandHandler do
  alias ToyRobot.{Simulation, Grid}

  @doc """
  Takes a command from the CommandProcessor and executes it

  ###PLACE command

  iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Grid}
  [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Grid]
  iex> command = {:place, %{north: 1, east: 2, facing: :north}}
  iex> CommandHandler.handle(command)
  {:ok, %Simulation{
    grid: %Grid{north_boundary: 4, east_boundary: 4},
    robot: %Robot{north: 1, east: 2, facing: :north}
  }}



  ## :move command

  iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Grid}
  [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Grid]
  iex> simulation = %Simulation{
  ...>   grid: %Grid{north_boundary: 4, east_boundary: 4},
  ...>   robot: %Robot{north: 1, east: 2, facing: "NORTH"}
  ...> }
  iex> CommandHandler.handle(:move, simulation)
  {:ok, %Simulation{
    grid: %Grid{north_boundary: 4, east_boundary: 4},
    robot: %Robot{north: 2, east: 2, facing: "NORTH"}
  }}

  ## :turn_left command

  iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Grid}
  [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Grid]
  iex> simulation = %Simulation{
  ...>   grid: %Grid{north_boundary: 4, east_boundary: 4},
  ...>   robot: %Robot{north: 1, east: 2, facing: "NORTH"}
  ...>   }
  iex> CommandHandler.handle(:turn_left, simulation)
  {:ok, %Simulation{
    grid: %Grid{north_boundary: 4, east_boundary: 4},
    robot: %Robot{north: 1, east: 2, facing: "WEST"}
  }}

  ## :turn_right command

  iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Grid}
  [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Grid]
  iex> simulation = %Simulation{
  ...>   grid: %Grid{north_boundary: 4, east_boundary: 4},
  ...>   robot: %Robot{north: 1, east: 2, facing: "NORTH"}
  ...>   }
  iex> CommandHandler.handle(:turn_right, simulation)
  {:ok, %Simulation{
    grid: %Grid{north_boundary: 4, east_boundary: 4},
    robot: %Robot{north: 1, east: 2, facing: "EAST"}
  }}

  ## :report command
  iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Grid}
  [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Grid]
  iex> simulation = %Simulation{
  ...>   grid: %Grid{north_boundary: 4, east_boundary: 4},
  ...>   robot: %Robot{north: 1, east: 2, facing: "NORTH"}
  ...>   }
  iex> CommandHandler.handle(:report, simulation)
  %Robot{north: 1, east: 2, facing: "NORTH"}

  ## Invalid commands

  iex> alias ToyRobot.{CommandHandler, Robot, Simulation, Grid}
  [ToyRobot.CommandHandler, ToyRobot.Robot, ToyRobot.Simulation, ToyRobot.Grid]
  iex> simulation = %Simulation{
  ...>   grid: %Grid{north_boundary: 4, east_boundary: 4},
  ...>   robot: %Robot{north: 1, east: 2, facing: :north},
  ...>   }
  iex> CommandHandler.handle({:invalid, "ROLL OVER"}, simulation)
  {:invalid, "ROLL OVER"}
  """

  def handle({:place, placement}) do
    %Grid{
      north_boundary: 4,
      east_boundary: 4
    }
    |> Simulation.place(placement)
  end

  # def run(:move, simulation) do
  #   simulation |> Simulation.move()
  # end

  def handle(:move, simulation) do
    simulation |> Simulation.move()
  end

  def handle(:turn_left, simulation) do
    simulation |> Simulation.turn_left()
  end

  def handle(:turn_right, simulation) do
    simulation |> Simulation.turn_right()
  end

  def handle(:report, simulation) do
    simulation |> Simulation.report()
  end

  def handle({:invalid, _cmd} = command, _simulation), do: command
end
