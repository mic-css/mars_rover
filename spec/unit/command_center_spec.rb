require 'command_center'

describe CommandCenter do
  subject(:command_center) do
    described_class.new(terrain_klass: terrain_klass)
  end

  let(:terrain_klass) { double('terrain_klass', new: nil) }
  let(:rover_klass) { double('rover_klass', new: nil) }

  describe '#plot_terrain' do
    it 'creates a new terrain with upper boundaries' do
      expect(terrain_klass).to receive(:new).with(5, 5)
      command_center.plot_terrain('5 5')
    end
  end
end
