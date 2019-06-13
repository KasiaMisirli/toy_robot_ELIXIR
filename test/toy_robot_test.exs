defmodule ToyRobot.RobotTest do
  use ExUnit.Case
  doctest ToyRobot.Robot
  alias ToyRobot.Robot

  describe "if the robot is facing north" do
    setup do
      {:ok, %{robot: %Robot{north: 0, facing: "NORTH"}}}
    end

    test "it move 1 step north", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
    end
  end

  describe "if the robot is facing east" do
    setup do
      {:ok, %{robot: %Robot{east: 0, facing: "EAST"}}}
    end

    test "it move 1 step east", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.east == 1
    end
  end

  describe "if the robot is facing west" do
    setup do
      {:ok, %{robot: %Robot{east: 0, facing: "WEST"}}}
    end

    test "it move 1 step west", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.east == -1
    end
  end

  describe "if the robot is facing south" do
    setup do
      {:ok, %{robot: %Robot{east: 0, facing: "SOUTH"}}}
    end

    test "it move 1 step south", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == -1
    end
  end

  describe "robot turns left" do
    setup do
      {:ok, %{robot: %Robot{east: 0, north: 0, facing: "NORTH"}}}
    end

    test "moves", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
    end

    test "turns left", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.facing == "WEST"
    end
  end

  describe "robot turns right when facing north" do
    setup do
      {:ok, %{robot: %Robot{east: 0, north: 0, facing: "NORTH"}}}
    end

    test "moves one space north", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
    end

    test "turns right", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == "EAST"
    end
  end

  describe "robot turns right when facing south" do
    setup do
      {:ok, %{robot: %Robot{east: 0, north: 0, facing: "SOUTH"}}}
    end

    test "moves one space south", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == -1
    end

    test "turns right", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.facing == "WEST"
    end
  end
end
