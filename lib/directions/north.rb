require_relative 'east'
require_relative 'west'

class North
  def initialize(east: East.new, west: West.new)
    @east = east
    @west = west
  end

  def right
    east
  end

  def left
    west
  end

  private

  attr_reader :east, :west
end
