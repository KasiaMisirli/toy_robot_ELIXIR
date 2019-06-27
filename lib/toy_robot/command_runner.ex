defmodule ToyRobot.CommandRunner do
  alias ToyRobot.CommandHandler

  def run([{:place, _placement} = command | rest]) do
    case CommandHandler.handle(command) do
      {:ok, simulation} -> run(rest, simulation)
      {:error, :invalid_placement} -> run(rest)
    end
  end

  def run([_command | rest]), do: run(rest)
  def run([]), do: nil

  def run([{:invalid, _command} | rest], simulation), do: run(rest, simulation)
  def run([:move | rest], simulation) do
    new_simulation = :move
    |> CommandHandler.handle(simulation)
    |> case do
      {:ok, simulation} -> simulation
      {:error, :at_table_boundary} -> simulation
    end
    run(rest, new_simulation)
  end

  def run(
    [:report | rest],
    simulation
  ) do
    %{
      east: east,
      north: north,
      facing: facing
    } = CommandHandler.handle(:report, simulation)

    facing = facing |> Atom.to_string |> String.upcase
    IO.puts "The robot is at (#{east}, #{north}) and is facing #{facing}"

    run(rest, simulation)
  end

  def run([command | rest], simulation) do
    {:ok, simulation} = command |> CommandHandler.handle(simulation)
    run(rest, simulation)
  end
  def run([], simulation), do: simulation
end
