class Rover
  attr_reader :direction

  def initialize(point, direction, terrain)
    @point = point
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
      raise 'Out of bounds' if y_coordinate + 1 > terrain.upper_y_coordinate
      point.increase_y
    when :E
      raise 'Out of bounds' if x_coordinate + 1 > terrain.upper_x_coordinate
      point.increase_x
    when :S
      raise 'Out of bounds' if y_coordinate - 1 < 0
      point.decrease_y
    when :W
      raise 'Out of bounds' if x_coordinate - 1 < 0
      point.decrease_x
    end
  end

  def coordinates
    [x_coordinate, y_coordinate]
  end

  private

  attr_reader :point, :terrain

  def current_direction
    direction.current
  end

  def x_coordinate
    point.x_coordinate
  end

  def y_coordinate
    point.y_coordinate
  end
end
