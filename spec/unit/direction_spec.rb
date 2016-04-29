require 'direction'

describe Direction do
  subject(:direction) { described_class.new(current_direction) }

  let(:current_direction) { double('current_direction', right: nil, left: nil) }

  describe '#self.build' do
    let(:direction_klass) { described_class }

    context 'when passed an incorrect direction' do
      it 'raises an error' do
        expect { direction_klass.build_with_direction(:foo) }
          .to raise_error('Invalid direction')
      end
    end
  end

  describe '#right' do
    it 'delegates #right to the current direction' do
      expect(current_direction).to receive(:right)
      direction.right
    end
  end

  describe '#left' do
    it 'delegates #left to the current direction' do
      expect(current_direction).to receive(:left)
      direction.left
    end
  end

  describe '#forward' do
    let(:point) { double('point') }
    let(:terrain) { double('terrain') }

    it 'delegates to the current direction with a point and a terrain' do
      expect(current_direction).to receive(:forward).with(point, terrain)
      direction.forward(point, terrain)
    end
  end
end
