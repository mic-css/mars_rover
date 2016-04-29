require_relative 'south'
require_relative 'north'

class East
  def initialize(south: South.new, north: North.new)
    @south = south
    @north = north
  end

  def right
    south
  end

  def left
    north
  end

  private

  attr_reader :south, :north
end
