defmodule ToyRobot.RobotTest do
  use ExUnit.Case
  doctest ToyRobot.Robot
  alias ToyRobot.Robot
  # TESTING MOVE
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

  # TEST MOVE AND FACING CHANGE
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

  # TEST MOVE AND FACING CHANGE
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

  # TESTING MOVE WITH PRESET POSITION
  describe "when the robot is facing east, and it has moved forward a space" do
    setup do
      {:ok, %{robot: %Robot{north: 1, facing: "EAST"}}}
    end

    test "the original position is saved the the new position is updated", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
      assert robot.east == 1
      assert robot.facing == "EAST"
    end
  end

  # TESTING FACING CHANGE WITH PRESET POSITION
  describe "when the robot is facing east, and it has changes the facing" do
    setup do
      {:ok, %{robot: %Robot{north: 1, east: 1, facing: "EAST"}}}
    end

    test "the original position is saved the the new position is updated", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.north == 1
      assert robot.east == 1
      assert robot.facing == "SOUTH"
    end
  end

  describe "when the robot is facing west, and it has changes the facing" do
    setup do
      {:ok, %{robot: %Robot{north: 1, east: 1, facing: "WEST"}}}
    end

    test "the original position is saved the the new position is updated", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.north == 1
      assert robot.east == 1
      assert robot.facing == "SOUTH"
    end
  end

  # TESTING MOVE WITH PRESET POSITION (MOVING TOWARD EVERY DIRECTION WITH POSITION UPDATE)
  describe "the moving towards WEST direction with keeping original position" do
    setup do
      {:ok, %{robot: %Robot{north: 1, east: 1, facing: "WEST"}}}
    end

    test "move WEST keeps the original position which is getting updated", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
      assert robot.east == 0
      assert robot.facing == "WEST"
    end
  end

  describe "tthe moving towards EAST direction with keeping original position" do
    setup do
      {:ok, %{robot: %Robot{north: 1, east: 1, facing: "EAST"}}}
    end

    test "move EAST keeps the original position which is getting updated", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 1
      assert robot.east == 2
      assert robot.facing == "EAST"
    end
  end

  describe "the moving towards NORTH direction with keeping original position" do
    setup do
      {:ok, %{robot: %Robot{north: 1, east: 1, facing: "NORTH"}}}
    end

    test "move NORTH keeps the original position which is getting updated", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 2
      assert robot.east == 1
      assert robot.facing == "NORTH"
    end
  end

  describe "the moving towards SOUTH direction with keeping original position" do
    setup do
      {:ok, %{robot: %Robot{north: 1, east: 1, facing: "SOUTH"}}}
    end

    test "move SOUTH keeps the original position which is getting updated", %{robot: robot} do
      robot = robot |> Robot.move()
      assert robot.north == 0
      assert robot.east == 1
      assert robot.facing == "SOUTH"
    end
  end

  # TESTING TURNING WITH KEEPING THE ORIGINAL LOCATION
  describe "robot turns right with keeping its original position" do
    setup do
      {:ok, %{robot: %Robot{north: 1, east: 1, facing: "NORTH"}}}
    end

    test "move SOUTH keeps the original position which is getting updated", %{robot: robot} do
      robot = robot |> Robot.turn_right()
      assert robot.north == 1
      assert robot.east == 1
      assert robot.facing == "EAST"
    end
  end

  describe "robot turns left with keeping its original position" do
    setup do
      {:ok, %{robot: %Robot{north: 1, east: 1, facing: "NORTH"}}}
    end

    test "move SOUTH keeps the original position which is getting updated", %{robot: robot} do
      robot = robot |> Robot.turn_left()
      assert robot.north == 1
      assert robot.east == 1
      assert robot.facing == "WEST"
    end
  end
end
