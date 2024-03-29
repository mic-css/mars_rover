require 'directions/north'
require 'directions/east'
require 'directions/west'
require 'point'

describe North do
  subject(:north) do
    described_class.new(east_klass: east_klass, west_klass: west_klass)
  end

  let(:east_klass) { double('east_klass', new: east) }
  let(:west_klass) { double('west_klass', new: west) }
  let(:east) { instance_double('east') }
  let(:west) { instance_double('west') }

  describe '#right' do
    it 'returns an instance of East' do
      expect(north.right).to eq(east)
    end
  end

  describe '#left' do
    it 'returns an instance of West' do
      expect(north.left).to eq(west)
    end
  end

  describe '#forward' do
    let(:point) { instance_double('point', increase_y: nil) }
    let(:terrain) { double('terrain') }

    it 'calls #increase_y on the given point with the given terrain' do
      expect(point).to receive(:increase_y).with(terrain)
      north.forward(point, terrain)
    end
  end

  describe '#to_sym' do
    it 'overrides #to_sym to display the cardinal point as a symbol' do
      expect(north.to_sym).to eq(:N)
    end
  end
end
