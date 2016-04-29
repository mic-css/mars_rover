require_relative 'south'
require_relative 'north'

class East
  def initialize(south_klass: South, north_klass: North)
    @south_klass = south_klass
    @north_klass = north_klass
  end

  def right
    @_south ||= south_klass.new
  end

  def left
    @_north ||= north_klass.new
  end

  private

  attr_reader :south_klass, :north_klass
end
