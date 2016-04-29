require 'directions/north'
require 'directions/east'
require 'directions/west'

describe North do
  subject(:north) { described_class.new(east: east, west: west) }

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
end
