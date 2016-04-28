require 'direction'

describe Direction do
  subject(:direction) { described_class.new }

  describe '#initialize' do
    it 'initializes with a Northernly direction by default' do
      expect(direction.current).to eq(:N)
    end
  end

  describe '#right' do
    it 'changes the direction from North to East' do
      direction.right
      expect(direction.current).to eq(:E)
    end

    it 'changes the direction from East to South' do
      2.times { direction.right }
      expect(direction.current).to eq(:S)
    end

    it 'changes the direction from South to West' do
      3.times { direction.right }
      expect(direction.current).to eq(:W)
    end

    it 'changes the direction from West to North' do
      4.times { direction.right }
      expect(direction.current).to eq(:N)
    end
  end
end
