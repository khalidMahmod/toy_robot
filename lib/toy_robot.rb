require_relative 'toy_robot/version'

# ToyRobot Module that takes user input & Calls the Robot class to process
module ToyRobot

  def self.main
    robot = Robot.new
  end

  # Robot class that moves, turns left/right with command
  class Robot
    def initialize(x = -1, y = -1, face = 'UNKNOWN', is_placed = false)
      @x = x
      @y = y
      @face = face
      @is_placed = is_placed
    end

    def placed?
      @is_placed
    end

    def print_result
      puts "#{@x},#{@y},#{@face}"
    end
  end
end
