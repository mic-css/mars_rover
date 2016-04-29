class Point
  attr_reader :x_coordinate, :y_coordinate

  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end

  def increase_x(boundary_point)
    @x_coordinate += 1
  end

  def decrease_x(boundary_point)
    @x_coordinate -= 1
  end

  def increase_y(boundary_point)
    @y_coordinate += 1
  end

  def decrease_y(boundary_point)
    @y_coordinate -= 1
  end
end
