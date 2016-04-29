require 'command_center'
require 'terrain'
require 'rover'
require 'point'

describe CommandCenter do
  subject(:command_center) do
    described_class.new(
      terrain_klass:    terrain_klass,
      point_klass:      point_klass,
      rover_klass:      rover_klass,
      direction_klass:  direction_klass
    )
  end

  let(:terrain_klass)   { double('terrain_klass', new: nil) }
  let(:rover_klass)     { double('rover_klass', new: nil) }
  let(:point_klass)     { double('point_klass', new: point) }
  let(:point)           { instance_double('point') }
  let(:direction_klass) { double('direction_klass', new: direction) }
  let(:direction)       { instance_double 'direction' }

  describe '#plot_terrain' do
    it 'creates a new terrain with upper boundaries' do
      expect(terrain_klass).to receive(:new).with(5, 5)
      command_center.plot_terrain('5 5')
    end
  end

  describe '#deploy_rover' do
    let(:terrain)   { instance_double 'terrain' }

    it 'creates a new rover with coordinates and direction' do
      expect(rover_klass).to receive(:new).with(point, direction, terrain)
      command_center.deploy_rover(terrain, '1 1 N')
    end
  end

  describe '#direct_rover' do
    let(:rover) { instance_double('rover', move: nil, turn_right: nil, turn_left: nil) }

    it 'delegates the "move" command to the rover' do
      expect(rover).to receive(:move)
      command_center.direct_rover(rover, 'M')
    end

    it 'delegates the "turn_right" command to the rover' do
      expect(rover).to receive(:turn_right)
      command_center.direct_rover(rover, 'R')
    end

    it 'delegates the "turn_left" command to the rover' do
      expect(rover).to receive(:turn_left)
      command_center.direct_rover(rover, 'L')
    end

    it 'parses input and delegates multiple commands to the rover' do
      expect(rover).to receive(:move).twice
      command_center.direct_rover(rover, 'MM')
    end
  end
end
