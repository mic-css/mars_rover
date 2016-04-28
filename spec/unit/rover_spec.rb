require 'rover'
require 'direction'
require 'terrain'

describe Rover do
  subject(:rover) { described_class.new(3, 3, direction, terrain) }

  let(:direction) do
    instance_double('direction', current: :N, right: nil, left: nil)
  end

  let(:terrain) do
    instance_double('terrain', upper_x_coordinate: 5, upper_y_coordinate: 5)
  end

  describe '#turn_right' do
    it 'calls #right on the direction' do
      expect(direction).to receive(:right)
      rover.turn_right
    end
  end

  describe '#turn_left' do
    it 'calls #left on the direction' do
      expect(direction).to receive(:left)
      rover.turn_left
    end
  end

  describe '#move' do
    context 'when moving within the terrain limit' do
      it 'moves to the adjacent coordinates in the given direction' do
        rover.move
        expect(rover.coordinates).to eq([3, 4])
      end
    end

    context 'when moving past the terrain limit' do
      it 'raises an error' do
        2.times { rover.move }
        expect { rover.move }.to raise_error 'Out of bounds'
      end
    end
  end
end
