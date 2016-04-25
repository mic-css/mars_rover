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
end
