defmodule ToyRobot do
  @moduledoc """
  Documentation for ToyRobot.
  """

  @doc """
  Moves one space forward.

  ## Examples

      iex> ToyRobot.move(%{position: 0})
      %{position: 1}

      iex> %{position: 0} |> ToyRobot.move |> ToyRobot.move
      %{position: 2}
  """
  def move(%{position: position}) do
    %{position: position + 1}
  end

  @doc """
  Turn left.

  ## Examples

      iex> ToyRobot.left(%{facing: "WEST"})
      %{facing: "SOUTH"}

    
  """
  def left(%{facing: facing}) do
    case %{facing: facing} do
      %{facing: "NORTH"} -> %{facing: "WEST"}
      %{facing: "WEST"} -> %{facing: "SOUTH"}
      %{facing: "EAST"} -> %{facing: "NORTH"}
      %{facing: "SOUTH"} -> %{facing: "EAST"}
    end
  end

  @doc """
  Turn right.

  ## Examples

      iex> ToyRobot.right(%{facing: "WEST"})
      %{facing: "NORTH"}

    
  """
  def right(%{facing: facing}) do
    case %{facing: facing} do
      %{facing: "NORTH"} -> %{facing: "EAST"}
      %{facing: "WEST"} -> %{facing: "NORTH"}
      %{facing: "EAST"} -> %{facing: "SOUTH"}
      %{facing: "SOUTH"} -> %{facing: "WEST"}
    end
  end
end
