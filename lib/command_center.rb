require 'terrain'

class CommandCenter
  def initialize(terrain_klass: Terrain)
    @terrain_klass = terrain_klass
  end

  def plot_terrain(string)
    boundary = string.split(' ').map(&:to_i)
    upper_x_coordinate = boundary[0]
    upper_y_coordinate = boundary[1]
    @terrain_klass.new(upper_x_coordinate, upper_y_coordinate)
  end
end
