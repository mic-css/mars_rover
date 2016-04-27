require 'command_center'

describe CommandCenter do
  subject(:command_center) do
    described_class.new(terrain_klass: terrain_klass, rover_klass: rover_klass)
  end

  let(:terrain_klass) { double('terrain_klass', new: nil) }
  let(:rover_klass) { double('rover_klass', new: nil) }

  describe '#plot_terrain' do
    it 'creates a new terrain with upper boundaries' do
      expect(terrain_klass).to receive(:new).with(5, 5)
      command_center.plot_terrain('5 5')
    end
  end

  describe '#deploy_rover' do
    let(:terrain) { double 'terrain' }

    it 'creates a new rover with coordinates and direction' do
      expect(rover_klass).to receive(:new).with(terrain, 1, 1, :N)
      command_center.deploy_rover(terrain, '1 1 N')
    end
  end

  describe '#direct_rover' do
    let(:rover) { double('rover', move: nil, turn_right: nil, turn_left: nil) }

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
