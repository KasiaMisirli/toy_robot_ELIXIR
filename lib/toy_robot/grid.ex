defmodule ToyRobot.Grid do
  defstruct [:height, :width]
  alias ToyRobot.Grid

  @doc """
  Grid function.

  ## Examples

    iex> alias ToyRobot.Grid
    alias ToyRobot.Grid
    iex> grid = %Grid{height: 4,width: 4}
    %Grid{height: 4,width: 4}
    iex> grid |> Grid.valid_position?(%{north: 4,east: 4})
    true
    iex> grid |> Grid.valid_position?(%{north: 0,east: 4})
    true
    iex> grid |> Grid.valid_position?(%{north: 8,east: 4})
    false
    iex> grid |> Grid.valid_position?(%{north: -1,east: 4})
    false
  """

  def valid_position?(%Grid{height: height, width: width}, %{north: north, east: east}) do
    north >= 0 && north <= height && east >= 0 && east <= width
  end
end
