require_relative 'toy_robot/version'

# ToyRobot Module that takes user input & Calls the Robot class to process
module ToyRobot
  START_BOUNDARY = 0
  END_BOUNDARY = 4

  # Directional Mapping
  DIR_MAP = {
    north: { left: 'WEST', right: 'EAST', direction: 'y', operator: '+' },
    south: { left: 'EAST', right: 'WEST', direction: 'y', operator: '-' },
    east: { left: 'NORTH', right: 'SOUTH', direction: 'x', operator: '+' },
    west: { left: 'SOUTH', right: 'NORTH', direction: 'x', operator: '-' }
  }.freeze

  def self.main
    robot = Robot.new

    while (user_input = gets.chomp)
      robot.place(user_input) if user_input.include?('PLACE')

      if robot.placed?
        break if user_input == 'EXIT'
        robot.process_command(user_input)
      end
    end
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

    # @param [Object] input
    def process_command(input)
      case input
      when 'LEFT', 'RIGHT'
        @face = DIR_MAP[@face.downcase.to_sym][input.downcase.to_sym]
      when 'MOVE'
        direction = DIR_MAP[@face.downcase.to_sym][:direction]

        position = eval('@' + direction + DIR_MAP[@face.downcase.to_sym][:operator] + '1')
        if position.between?(START_BOUNDARY, END_BOUNDARY)
          instance_variable_set("@#{DIR_MAP[@face.downcase.to_sym][:direction]}", position)
        end
      when 'REPORT'
        print_result
      end
    end

    def place(input)
      position = input.split(' ')[1].split(',')
      is_position_valid = [position[0], position[1]].all? do |n|
        n.to_i.between?(START_BOUNDARY, END_BOUNDARY)
      end

      if is_position_valid
        @x = position[0].to_i
        @y = position[1].to_i
        @face = position[2]
        @is_placed = true
      end
    end
  end
end
