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

  private

  attr_reader :north_klass, :south_klass
end
