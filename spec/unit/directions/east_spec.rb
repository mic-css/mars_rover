require 'directions/east'
require 'directions/south'
require 'directions/north'

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
end
