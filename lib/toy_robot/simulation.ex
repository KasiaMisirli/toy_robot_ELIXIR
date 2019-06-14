defmodule ToyRobot.Simulation do
  defstruct [:grid, :robot]
  alias ToyRobot.{Robot, Grid}

  @doc """
  Simulates the moves.

  ## Examples
      iex> alias ToyRobot.{Robot,Grid,Simulation}
      [ToyRobot.Robot,ToyRobot.Grid, ToyRobot.Simulation]
      iex> grid = %Grid{width: 4,height: 4}
      %Grid{width: 4,height: 4}
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
end
