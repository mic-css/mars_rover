class Rover
  DIRECTIONS = [:N, :E, :S, :W]

  attr_reader :coordinates, :direction

  def initialize(x_coordinate, y_coordinate, direction)
    @coordinates = [x_coordinate, y_coordinate]
    @direction = direction
  end

  def turn_right
    @direction = DIRECTIONS[direction_index + 1]
  end

  def turn_left
    @direction = DIRECTIONS[direction_index - 1]
  end

  private

  def direction_index
    DIRECTIONS.index(direction)
  end
end
