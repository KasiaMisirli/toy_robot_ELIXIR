alias ToyRobot.Robot

%Robot{east: 0, north: 0, facing: "NORTH"}
|> Robot.move()
|> Robot.turn_right()
|> Robot.move()
|> Robot.move()
|> Robot.turn_left()
|> Robot.move()
|> IO.inspect()
