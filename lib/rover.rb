class Rover
  DIRECTIONS = [:N, :E, :S, :W]

  attr_reader :direction

  def initialize(x_coordinate, y_coordinate, direction, terrain)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
    @terrain = terrain
  end

  def turn_right
    direction.right
  end

  def turn_left
    direction.left
  end

  def move
    case current_direction
    when :N
      raise 'Out of bounds' if @y_coordinate + 1 > terrain.upper_y_coordinate
      @y_coordinate += 1
    when :E
      raise 'Out of bounds' if @x_coordinate + 1 > terrain.upper_x_coordinate
      @x_coordinate += 1
    when :S
      raise 'Out of bounds' if @y_coordinate - 1 < 0
      @y_coordinate -= 1
    when :W
      raise 'Out of bounds' if @x_coordinate - 1 < 0
      @x_coordinate -= 1
    end
  end

  def coordinates
    [x_coordinate, y_coordinate]
  end

  private

  attr_reader :x_coordinate, :y_coordinate, :terrain

  def current_direction
    direction.current
  end
end
