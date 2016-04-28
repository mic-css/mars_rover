require 'direction'

describe Direction do
  subject(:direction) { described_class.new(:N) }

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

  describe '#left' do
    it 'changes the direction from North to West' do
      direction.left
      expect(direction.current).to eq(:W)
    end

    it 'changes the direction from West to South' do
      2.times { direction.left }
      expect(direction.current).to eq(:S)
    end

    it 'changes the direction from South to East' do
      3.times { direction.left }
      expect(direction.current).to eq(:E)
    end

    it 'changes the direction from East to North' do
      4.times { direction.left }
      expect(direction.current).to eq(:N)
    end
  end
end
