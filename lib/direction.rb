class Direction
  DIRECTIONS = [:N, :E, :S, :W]

  attr_reader :current

  def self.build_with_direction(direction)
    raise 'Invalid direction' unless DIRECTIONS.include?(direction)
    new(direction)
  end

  def initialize(current)
    @current = current
  end

  def right
    @current = next_direction_right
  end

  def left
    @current = next_direction_left
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
