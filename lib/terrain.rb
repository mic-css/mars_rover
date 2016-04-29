class Terrain
  attr_reader :boundary_point
  
  def initialize(boundary_point)
    @boundary_point = boundary_point
  end

  def x_boundary
    boundary_point.x_coordinate
  end

  def y_boundary
    boundary_point.y_coordinate
  end
end
