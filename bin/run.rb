#!/usr/bin/ruby

require './lib/command_center'

def capture_input
  input = gets.chomp.upcase
  exit if input == 'EXIT'
  input
end

command_center = CommandCenter.new

puts %q(Welcome to the NASA Mars Rover command center.
Type "exit" at any time to quit the program.)

puts 'Enter terrain boundary:'
terrain = command_center.plot_terrain(capture_input)

while true do
  puts 'Enter new rover coordinates:'
  rover = command_center.deploy_rover(terrain, capture_input)

  puts 'Enter rover directions:'
  command_center.direct_rover(rover, capture_input)

  puts "Rover position: #{rover.position.map(&:to_s).join(' ')}"
end
