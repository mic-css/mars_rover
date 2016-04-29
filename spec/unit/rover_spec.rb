require 'rover'
require 'point'
require 'direction'
require 'terrain'

describe Rover do
  subject(:rover) { described_class.new(point, direction, terrain) }

  let(:point) do
    instance_double('point', y_coordinate: 3, x_coordinate: 5, increase_y: 4, increase_x: 6)
  end

  let(:direction) do
    instance_double('direction', current: :N, right: :E, left: :W)
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
      it 'calls #forward on the current point' do
        expect(point).to receive(:increase_y)
        rover.move
      end
    end

    context 'when moving past the terrain limit' do
      let(:eastern_direction) { instance_double('direction', current: :E) }
      let(:border_rover) { described_class.new(point, eastern_direction, terrain) }

      it 'raises an error' do
        expect { border_rover.move }.to raise_error 'Out of bounds'
      end
    end
  end
end
