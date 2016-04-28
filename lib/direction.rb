class Direction
  DIRECTIONS = [:N, :E, :S, :W]

  attr_reader :current

  def initialize(current: :N)
    @current = current
  end
end
