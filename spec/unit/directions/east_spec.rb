require 'directions/east'
require 'directions/south'
require 'directions/north'
require 'point'

describe East do
  subject(:east) do
    described_class.new(south_klass: south_klass, north_klass: north_klass)
  end

  let(:south_klass) { double('south_klass', new: south) }
  let(:north_klass) { double('north_klass', new: north) }
  let(:south) { instance_double('south') }
  let(:north) { instance_double('north') }

  describe '#right' do
    it 'returns an instance of South' do
      expect(east.right).to eq(south)
    end
  end

  describe '#left' do
    it 'returns an instance of North' do
      expect(east.left).to eq(north)
    end
  end

  describe '#forward' do
    let(:point) { instance_double('point', increase_x: nil) }
    let(:terrain) { double('terrain') }

    it 'calls #increase_x on the given point with the given terrain' do
      expect(point).to receive(:increase_x).with(terrain)
      east.forward(point, terrain)
    end
  end

  describe '#to_sym' do
    it 'overrides #to_sym to display the cardinal point as a symbol' do
      expect(east.to_sym).to eq(:E)
    end
  end
end
