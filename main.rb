# frozen_string_literal: true

require_relative 'lib/rover'
require_relative 'lib/load_data'

def extract_rover_init_data(rover_data)
  r = rover_data.delete(' ')
  return r[0].to_i, r[1].to_i, r[2]
end

def movements(move_sequence)
  move_sequence.split('')
end

plateau_dimension, rovers_prog = LoadData.call

rovers_prog.each do |rover_data|
  x_init, y_init, dir_init = extract_rover_init_data(rover_data[0])
  move_sequence = rover_data[1]

  rover = Rover.new(direction: dir_init, x_pos: x_init, y_pos: y_init, plateau_dim: plateau_dimension)

  movements(move_sequence).each do |movement|
    case movement
    when 'L'
      rover.head_left
    when 'R'
      rover.head_right
    when 'M'
      rover.move
    end
  end
  rover.report_position
end
