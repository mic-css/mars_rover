require 'directions/south'
require 'directions/west'
require 'directions/east'

describe South do
  subject(:south) { described_class.new(west: west, east: east) }

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
end
