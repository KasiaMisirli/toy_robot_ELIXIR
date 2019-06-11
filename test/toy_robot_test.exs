defmodule ToyRobotTest do
  use ExUnit.Case
  doctest ToyRobot

  test "the robot moves" do
    assert ToyRobot.move(%{position: 1}) == %{position: 2}
  end

  test "the robot turns towards left" do
    assert ToyRobot.left(%{facing: "WEST"}) == %{facing: "SOUTH"}
  end

  test "the robot turns towards right" do
    assert ToyRobot.right(%{facing: "WEST"}) == %{facing: "NORTH"}
  end
end
