class Terrain
  attr_reader :upper_x_coordinate, :upper_y_coordinate

  def initialize(upper_x_coordinate, upper_y_coordinate)
    @upper_x_coordinate = upper_x_coordinate
    @upper_y_coordinate = upper_y_coordinate
  end
end
