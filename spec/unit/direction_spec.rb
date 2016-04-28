require 'direction'

describe Direction do
  subject(:direction) { described_class.new(:N) }

  describe '#self.build' do
    let(:direction_klass) { described_class }

    it 'creates a new instance from the given cardinal points' do
      direction = direction_klass.build_with_direction(:S)
      expect(direction.current).to eq(:S)
    end

    context 'when passed an incorrect direction' do
      it 'raises an error' do
        expect { direction_klass.build_with_direction(:foo) }
          .to raise_error('Invalid direction')
      end
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
