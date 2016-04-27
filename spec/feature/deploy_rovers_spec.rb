require 'command_center'

describe 'Deploying multiple rovers' do
  it 'outputs the final coordinates of each rover' do
    command_center = CommandCenter.new

    terrain = command_center.plot_terrain('5 5')

    rover_1 = command_center.deploy_rover(terrain, '1 2 N')
    command_center.direct_rover(rover_1, 'LMLMLMLMM')

    rover_2 = command_center.deploy_rover(terrain, '3 3 E')
    command_center.direct_rover(rover_2, 'MMRMMRMRRM')

    expect(rover_1.coordinates).to eq([1, 3]) #N
    expect(rover_2.coordinates).to eq([5, 1]) #E
  end
end
