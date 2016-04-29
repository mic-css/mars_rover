require 'directions/west'
require 'directions/north'
require 'directions/south'

describe West do
  subject(:west) { described_class.new(north: north, south: south) }

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
