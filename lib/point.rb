class Point
  attr_reader :x_coordinate, :y_coordinate

  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end

  def increase_x
    @x_coordinate += 1
  end

  def decrease_x
    @x_coordinate -= 1
  end

  def increase_y
    @y_coordinate += 1
  end

  def decrease_y
    @y_coordinate -= 1
  end
end
