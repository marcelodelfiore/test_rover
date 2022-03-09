# frozen_string_literal: true

require 'pry-byebug'

class Rover

  def initialize(direction: 'N', x_pos: 0, y_pos: 0, plateau_dim: [5, 5])
    @x_pos = x_pos
    @y_pos = y_pos
    @direction = direction

    # TODO: this better be a class variable instead
    @plateau_dim = plateau_dim
  end

  def move
    case @direction
      when 'N'
        @y_pos += 1
      when 'S'
        @y_pos -= 1
      when 'E'
        @x_pos += 1
      when 'W'
        @x_pos -= 1
    end
    limit_position
  end

  def head_left
    @direction =
      case @direction
        when 'N'
          'W'
        when 'S'
          'E'
        when 'E'
          'N'
        when 'W'
          'S'
      end
  end

  def head_right
    @direction =
      case @direction
        when 'N'
          'E'
        when 'S'
          'W'
        when 'E'
          'S'
        when 'W'
          'N'
      end
  end

  def report_position
    p "#{@x_pos} #{@y_pos} #{@direction}"
  end

  attr_accessor :x_pos, :y_pos, :direction

  private

  def limit_position
    if @x_pos > @plateau_dim[0]
      @x_pos = @plateau_dim[0]
    elsif @x_pos < 0
      @x_pos = 0
    end
    if @y_pos > @plateau_dim[1]
      @y_pos = @plateau_dim[1]
    elsif @y_pos < 0
      @y_pos = 0
    end
  end
end

