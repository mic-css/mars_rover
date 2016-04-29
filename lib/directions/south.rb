class South
  def initialize(west: West.new, east: East.new)
    @west = west
    @east = east
  end

  def right
    west
  end

  def left
    east
  end

  private

  attr_reader :west, :east
end
