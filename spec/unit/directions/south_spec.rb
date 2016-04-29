require 'directions/south'
require 'directions/west'
require 'directions/east'
require 'point'

describe South do
  subject(:south) do
    described_class.new(west_klass: west_klass, east_klass: east_klass)
  end

  let(:east_klass) { double('east_klass', new: east) }
  let(:west_klass) { double('west_klass', new: west) }
  let(:west) { instance_double('west') }
  let(:east) { instance_double('east') }

  describe '#right' do
    it 'returns an instance of West' do
      expect(south.right).to eq(west)
    end
  end

  describe '#left' do
    it 'returns an instance of East' do
      expect(south.left).to eq(east)
    end
  end

  describe '#forward' do
    let(:point) { instance_double('point', decrease_y: nil) }
    let(:terrain) { double('terrain') }

    it 'calls #decrease_y on the given point with the given terrain' do
      expect(point).to receive(:decrease_y).with(terrain)
      south.forward(point, terrain)
    end
  end
end
