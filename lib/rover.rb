class Rover
  # TODO: extract Direction class
  # TODO: extract Coordinates class
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

  def move
    case direction
    when :N
      coordinates[1] += 1
    when :E
      coordinates[0] += 1
    when :S
      coordinates[1] -= 1
    when :W
      coordinates[0] -= 1
    end
  end

  private

  def direction_index
    DIRECTIONS.index(direction)
  end
end
