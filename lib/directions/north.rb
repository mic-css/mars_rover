require_relative 'east'
require_relative 'west'

class North
  def initialize(east_klass: East, west_klass: West)
    @east_klass = east_klass
    @west_klass = west_klass
  end

  def right
    @_east ||= east_klass.new
  end

  def left
    @_west ||= west_klass.new
  end

  def forward(point, terrain)
    point.increase_y(terrain)
  end

  def to_sym
    :N
  end

  private

  attr_reader :east_klass, :west_klass
end
