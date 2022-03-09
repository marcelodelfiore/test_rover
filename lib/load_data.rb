# frozen_string_literal: true

require 'pry-byebug'

class LoadData
  def self.call
    file = File.open("rover_prog.txt")
    result = file.readlines.map(&:chomp)
    return formated_plateau_dim(result[0]), formated_rovers_prog(result.drop(1))
  end

  private

  def self.formated_plateau_dim(raw_data)
    raw_data.split(' ').map { |elem| elem.to_i }
  end

  def self.formated_rovers_prog(progs_array)
    progs_array.each_slice(2).to_a
  end
end
