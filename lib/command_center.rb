require_relative 'terrain'
require_relative 'rover'
require_relative 'direction'

class CommandCenter
  def initialize(terrain_klass: Terrain, rover_klass: Rover, direction_klass: Direction)
    @terrain_klass    = terrain_klass
    @rover_klass      = rover_klass
    @direction_klass  = direction_klass
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
    direction = @direction_klass.new(coordinates[2].to_sym)
    @rover_klass.new(x_coordinate, y_coordinate, direction, terrain)
  end

  def direct_rover(rover, directions)
    directions.each_char do |command|
      if command == 'M'
        rover.move
      elsif command == 'R'
        rover.turn_right
      elsif command == 'L'
        rover.turn_left
      end
    end
  end
end
