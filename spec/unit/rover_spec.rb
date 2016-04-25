require 'rover'

describe Rover do
  subject(:rover) { described_class.new(3, 3, :N) }

  describe '#initialize' do
    it 'initializes with a set of coordinates' do
      expect(rover.coordinates).to eq([3, 3])
    end

    it 'initializes with a direction' do
      expect(rover.direction).to eq(:N)
    end
  end

  describe '#turn_right' do
    it 'changes the direction by 90 degrees to the right' do
      rover.turn_right
      expect(rover.direction).to eq(:E)
    end
  end

  describe '#turn_left' do
    it 'changes the direction by 90 degrees to the left' do
      rover.turn_left
      expect(rover.direction).to eq(:W)
    end
  end
end
