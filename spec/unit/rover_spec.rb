require 'rover'
require 'point'
require 'direction'
require 'terrain'
require 'directions/north'

describe Rover do
  subject(:rover) { described_class.new(point, direction, terrain) }

  let(:point) do
    instance_double('point', y_coordinate: 3, x_coordinate: 5, increase_y: 4, increase_x: 6)
  end

  let(:direction) do
    instance_double('direction', current: north, forward: nil, right: nil, left: nil)
  end
  let(:north) { instance_double('north') }
  let(:terrain) { instance_double('terrain', boundary_point: boundary_point) }
  let(:boundary_point) { instance_double('point') }

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
    it 'calls #forward on the direction with current point and terrain' do
      expect(direction).to receive(:forward).with(point, boundary_point)
      rover.move
    end
  end

  describe '#position' do
    xit 'returns the current coordinates and direction' do
      expect(rover.position)
        .to eq([point.x_coordinate, point.y_coordinate, north])
    end
  end
end
