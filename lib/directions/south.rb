require_relative 'west'
require_relative 'east'

class South
  def initialize(west_klass: West, east_klass: East)
    @west_klass = west_klass
    @east_klass = east_klass
  end

  def right
    @_west ||= west_klass.new
  end

  def left
    @_east ||= east_klass.new
  end

  def forward(point, terrain)
    point.decrease_y(terrain)
  end

  private

  attr_reader :west_klass, :east_klass
end
