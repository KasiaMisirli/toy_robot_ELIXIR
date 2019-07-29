defmodule ToyRobot.Game.Player do
  alias ToyRobot.{Simulation, Table}
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(robot) do
    simulation = %Simulation{
      table: %Table{
        north_boundary: 4,
        east_boundary: 4
      },
      robot: robot
    }

    {:ok, simulation}
  end

  def handle_call(:move, _from, simulation) do
    {:ok, new_simulation} = simulation |> Simulation.move()
    {:reply, new_simulation, new_simulation}
  end

  def handle_call(:turn_left, _from, simulation) do
    {:ok, new_simulation} = simulation |> Simulation.turn_left()
    {:reply, new_simulation, new_simulation}
  end

  def handle_call(:turn_right, _from, simulation) do
    {:ok, new_simulation} = simulation |> Simulation.turn_right()
    {:reply, new_simulation, new_simulation}
  end

  def handle_call(:report, _from, robot) do
    {:reply, robot, robot}
  end

  def handle_call({:place, coordinates}, _from, simulation) do
    coordiantes_in_array = String.split(coordinates, ",")

    new_north = Enum.at(coordiantes_in_array, 0) |> String.to_integer()
    new_east = Enum.at(coordiantes_in_array, 1) |> String.to_integer()
    new_facing = Enum.at(coordiantes_in_array, 2) |> String.downcase() |> String.to_atom()

    new_coordinates = %ToyRobot.Robot{east: new_east, facing: new_facing, north: new_north}
    {:ok, new_simulation} = Simulation.place(simulation.table, new_coordinates)
    {:reply, new_simulation, new_simulation}
  end
end
