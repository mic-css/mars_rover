class Rover
  # TODO: extract Direction class
  # TODO: extract Coordinates class
  DIRECTIONS = [:N, :E, :S, :W]

  attr_reader :direction

  def initialize(x_coordinate, y_coordinate, direction, terrain)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
    @terrain = terrain
  end

  def turn_right
    @direction = right_direction
  end

  def turn_left
    @direction = left_direction
  end

  def move
    case direction
    when :N
      raise 'Out of bounds' if out_of_bounds?
      @y_coordinate += 1
    when :E
      raise 'Out of bounds' if out_of_bounds?
      @x_coordinate += 1
    when :S
      raise 'Out of bounds' if out_of_bounds?
      @y_coordinate -= 1
    when :W
      raise 'Out of bounds' if out_of_bounds?
      @x_coordinate -= 1
    end
  end

  def coordinates
    [x_coordinate, y_coordinate]
  end

  private

  attr_reader :x_coordinate, :y_coordinate, :terrain

  def direction_index
    DIRECTIONS.index(direction)
  end

  def right_direction
    DIRECTIONS[(direction_index + 1) % DIRECTIONS.length]
  end

  def left_direction
    DIRECTIONS[(direction_index - 1) % DIRECTIONS.length]
  end

  def out_of_bounds?
    @y_coordinate + 1 > terrain.upper_y_coordinate ||
    @y_coordinate - 1 < 0 ||
    @x_coordinate + 1 > terrain.upper_x_coordinate ||
    @x_coordinate - 1 < 0
  end
end
