require_relative 'directions/north'
require_relative 'directions/east'
require_relative 'directions/south'
require_relative 'directions/west'

class Direction
  DIRECTIONS = {N: North.new, E: East.new, S: South.new, W: West.new}

  attr_reader :current

  def self.build_with_direction(direction)
    raise 'Invalid direction' unless DIRECTIONS.include?(direction)
    new(DIRECTIONS[direction])
  end

  def initialize(current)
    @current = current
  end

  def right
    @current = current.right
  end

  def left
    @current = current.left
  end

  def forward(point, terrain)
    current.forward(point, terrain)
  end
end
