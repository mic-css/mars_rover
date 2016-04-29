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
    direction.forward(point, terrain.boundary_point)
  end

  def position
    [x_coordinate, y_coordinate, current_direction]
  end

  private

  attr_reader :point, :terrain

  def current_direction
    direction.current.to_sym
  end

  def x_coordinate
    point.x_coordinate
  end

  def y_coordinate
    point.y_coordinate
  end
end
