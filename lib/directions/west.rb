require_relative 'north'
require_relative 'south'

class West
  def initialize(north_klass: North, south_klass: South)
    @north_klass = north_klass
    @south_klass = south_klass
  end

  def right
    @_north ||= north_klass.new
  end

  def left
    @_south ||= south_klass.new
  end

  def to_sym
    :W
  end

  def forward(point, terrain)
    point.decrease_x(terrain)
  end

  private

  attr_reader :north_klass, :south_klass
end
