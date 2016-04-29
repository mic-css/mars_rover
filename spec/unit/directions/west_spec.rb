require 'directions/west'
require 'directions/north'
require 'directions/south'

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
end
