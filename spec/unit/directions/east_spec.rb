require 'directions/east'
require 'directions/south'
require 'directions/north'

describe East do
  subject(:east) { described_class.new(south: south, north: north) }

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
