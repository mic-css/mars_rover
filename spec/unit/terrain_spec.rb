require 'terrain'

describe Terrain do
  subject(:terrain) { described_class.new(5, 5) }

  describe '#initialize' do
    it 'initializes with an upper x-coordinate' do
      expect(terrain.upper_x_coordinate).to eq(5)
    end

    it 'initializes with an upper y-coordinate' do
      expect(terrain.upper_y_coordinate).to eq(5)
    end
  end
end
