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
    it 'changes the direction from North to East' do
      rover.turn_right
      expect(rover.direction).to eq(:E)
    end

    it 'changes the direction from East to South' do
      2.times { rover.turn_right }
      expect(rover.direction).to eq(:S)
    end

    it 'changes the direction from South to West' do
      3.times { rover.turn_right }
      expect(rover.direction).to eq(:W)
    end

    it 'changes the direction from West to North' do
      4.times { rover.turn_right }
      expect(rover.direction).to eq(:N)
    end
  end

  describe '#turn_left' do
    it 'changes the direction from North to West' do
      rover.turn_left
      expect(rover.direction).to eq(:W)
    end

    it 'changes the direction from West to South' do
      2.times { rover.turn_left }
      expect(rover.direction).to eq(:S)
    end

    it 'changes the direction from South to East' do
      3.times { rover.turn_left }
      expect(rover.direction).to eq(:E)
    end

    it 'changes the direction from East to North' do
      4.times { rover.turn_left }
      expect(rover.direction).to eq(:N)
    end
  end

  describe '#move' do
    it 'moves to the adjacent coordinates in the given direction' do
      rover.move
      expect(rover.coordinates).to eq([3, 4])
    end
  end
end
