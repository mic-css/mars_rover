class Direction
  DIRECTIONS = [:N, :E, :S, :W]

  attr_reader :current

  def initialize(current: :N)
    @current = current
  end

  def right
    @current = next_direction_right
  end

  private

  def direction_index
    DIRECTIONS.index(current)
  end

  def next_direction_right
    DIRECTIONS[(direction_index + 1) % DIRECTIONS.length]
  end

  def next_direction_left
    DIRECTIONS[(direction_index - 1) % DIRECTIONS.length]
  end
end
