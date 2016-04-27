require 'terrain'

class CommandCenter
  def initialize(terrain_klass: Terrain, rover_klass: Rover)
    @terrain_klass = terrain_klass
    @rover_klass = rover_klass
  end

  def plot_terrain(boundary)
    boundary = boundary.split(' ').map(&:to_i)
    upper_x_coordinate = boundary[0]
    upper_y_coordinate = boundary[1]
    @terrain_klass.new(upper_x_coordinate, upper_y_coordinate)
  end

  def deploy_rover(terrain, coordinates)
    coordinates = coordinates.split(' ')
    x_coordinate = coordinates[0].to_i
    y_coordinate = coordinates[1].to_i
    direction = coordinates[2].to_sym
    @rover_klass.new(terrain, x_coordinate, y_coordinate, direction)
  end
end
