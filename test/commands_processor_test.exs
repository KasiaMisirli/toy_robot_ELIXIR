defmodule ToyRobot.CommandProcessorTest do
  use ExUnit.Case, async: true
  doctest ToyRobot.CommandProcessor

  alias ToyRobot.CommandProcessor

  test "handle all commands" do
    commands = ["PLACE1,2,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    commands |> CommandProcessor.process()
  end

  test "marks invalid commands as invalid" do
    commands = ["SPIN", "ROLL OVER", "PLAY DEAD"]
    output = commands |> CommandProcessor.process()

    assert output == [
             {:invalid, "SPIN"},
             {:invalid, "ROLL OVER"},
             {:invalid, "PLAY DEAD"}
           ]
  end
end
