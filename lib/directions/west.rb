require_relative 'north'
require_relative 'south'

class West
  def initialize(north: North.new, south: South.new)
    @north = north
    @south = south
  end

  def right
    north
  end

  def left
    south    
  end

  private

  attr_reader :north, :south
end
