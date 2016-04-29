require 'terrain'
require 'point'

describe Terrain do
  subject(:terrain) { described_class.new(point) }

  let(:point) { instance_double('point', x_coordinate: 5, y_coordinate: 5) }

  describe '#initialize' do
    it 'initializes with an x-coordinate boundary' do
      expect(terrain.x_boundary).to eq(5)
    end

    it 'initializes with a y-coordinate boundary' do
      expect(terrain.y_boundary).to eq(5)
    end
  end
end
