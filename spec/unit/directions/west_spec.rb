require 'directions/west'
require 'directions/north'
require 'directions/south'
require 'point'

describe West do
  subject(:west) do
    described_class.new(north_klass: north_klass, south_klass: south_klass)
  end

  let(:north_klass) { double('north_klass', new: north) }
  let(:south_klass) { double('south_klass', new: south) }
  let(:north) { instance_double('north') }
  let(:south) { instance_double('south') }

  describe '#right' do
    it 'returns an instance of North' do
      expect(west.right).to eq(north)
    end
  end

  describe '#left' do
    it 'returns an instance of South' do
      expect(west.left).to eq(south)
    end
  end

  describe '#forward' do
    let(:point) { instance_double('point', decrease_x: nil) }
    let(:terrain) { double('terrain') }

    it 'calls #decrease_x on the given point with the given terrain' do
      expect(point).to receive(:decrease_x).with(terrain)
      west.forward(point, terrain)
    end
  end

  describe '#to_sym' do
    it 'overrides #to_sym to display the cardinal point as a symbol' do
      expect(west.to_sym).to eq(:W)
    end
  end
end
