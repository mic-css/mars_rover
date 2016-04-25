class Rover
  attr_reader :coordinates, :direction

  def initialize(x_coordinate, y_coordinate, direction)
    @coordinates = [x_coordinate, y_coordinate]
    @direction = direction
  end
end
