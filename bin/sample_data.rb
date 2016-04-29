#!/usr/bin/ruby

require './lib/command_center'

puts %q(
Input:
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM)

command_center = CommandCenter.new
terrain = command_center.plot_terrain('5 5')

rover_1 = command_center.deploy_rover(terrain, '1 2 N')
command_center.direct_rover(rover_1, 'LMLMLMLMM')

rover_2 = command_center.deploy_rover(terrain, '3 3 E')
command_center.direct_rover(rover_2, 'MMRMMRMRRM')

puts %Q(
Output:
#{rover_1.position.map(&:to_s).join(' ')}
#{rover_2.position.map(&:to_s).join(' ')})
