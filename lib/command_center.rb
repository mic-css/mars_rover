require_relative 'terrain'
require_relative 'rover'
require_relative 'direction'
require_relative 'point'

class CommandCenter
  def initialize(terrain_klass: Terrain, rover_klass: Rover, point_klass: Point, direction_klass: Direction)
    @terrain_klass    = terrain_klass
    @rover_klass      = rover_klass
    @point_klass      = point_klass
    @direction_klass  = direction_klass
  end

  def plot_terrain(boundary)
    boundary = boundary.split(' ')
    boundary_point = parse_point(boundary)
    @terrain_klass.new(boundary_point)
  end

  def deploy_rover(terrain, coordinates)
    coordinates = coordinates.split(' ')
    point = parse_point(coordinates)
    direction = parse_direction(coordinates)
    @rover_klass.new(point, direction, terrain)
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

  private

  def parse_point(coordinates)
    x_coordinate = coordinates[0].to_i
    y_coordinate = coordinates[1].to_i
    @point_klass.new(x_coordinate, y_coordinate)
  end

  def parse_direction(coordinates)
    direction = coordinates[2].to_sym
    @direction_klass.build_with_direction(direction)
  end
end
