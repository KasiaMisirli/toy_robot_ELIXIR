defmodule ToyRobot.Grid do
  defstruct [:north_boundary, :east_boundary]
  alias ToyRobot.Grid

  @doc """
  Grid function.

  ## Examples

    iex> alias ToyRobot.Grid
    alias ToyRobot.Grid
    iex> grid = %Grid{north_boundary: 4,east_boundary: 4}
    %Grid{north_boundary: 4,east_boundary: 4}
    iex> grid |> Grid.valid_position?(%{north: 4,east: 4})
    true
    iex> grid |> Grid.valid_position?(%{north: 0,east: 4})
    true
    iex> grid |> Grid.valid_position?(%{north: 8,east: 4})
    false
    iex> grid |> Grid.valid_position?(%{north: -1,east: 4})
    false
  """

  def valid_position?(%Grid{north_boundary: north_boundary, east_boundary: east_boundary}, %{
        north: north,
        east: east
      }) do
    north >= 0 && north <= north_boundary && east >= 0 && east <= east_boundary
  end
end
