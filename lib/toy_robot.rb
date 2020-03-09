require_relative 'toy_robot/version'

##
# ToyRobot Module that takes user input & Calls the Robot class to process
module ToyRobot
  # Table Boundaries
  START_BOUNDARY = 0
  END_BOUNDARY = 4

  # Directional Mapping
  DIR_MAP = {
    north: { left: 'WEST', right: 'EAST', direction: 'y', operator: '+' },
    south: { left: 'EAST', right: 'WEST', direction: 'y', operator: '-' },
    east: { left: 'NORTH', right: 'SOUTH', direction: 'x', operator: '+' },
    west: { left: 'SOUTH', right: 'NORTH', direction: 'x', operator: '-' }
  }.freeze

  # Delegates task to Robot class based on input
  def self.main
    robot = Robot.new

    # Prompts for user input until "EXIT" command
    while (user_input = gets.chomp)
      if user_input.include?('PLACE')
        # Check if valid Place command
        regex = /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
        next unless !!(user_input =~ regex)
        robot.place(user_input)
      end

      break if user_input == 'EXIT'
      robot.process(user_input)
    end
  end

  ##
  # Robot class that moves, turns left/right with user command
  class Robot
    def initialize(x = -1, y = -1, face = 'UNKNOWN', is_placed = false)
      @x = x
      @y = y
      @face = face
      @is_placed = is_placed
    end

    # Check if Robot is placed on the table or not
    def placed?
      @is_placed
    end

    # Display position of the Robot
    def report
      puts "#{@x},#{@y},#{@face}"
    end

    # @param [Object] input
    # It processes the user input
    def process(input)
      if placed?
        case input
        when 'LEFT', 'RIGHT'
          turn(input)
        when 'MOVE'
          move
        when 'REPORT'
          report
        end
      end
    end

    # Place the robot on the table
    def place(input)
      position = input.split(' ')[1].split(',')

      # Check if valid?
      if is_valid?(position)
        @x = position[0].to_i
        @y = position[1].to_i
        @face = position[2]
        @is_placed = true
      end
    end

    # Move the Robot on the table
    def move
      direction = DIR_MAP[@face.downcase.to_sym][:direction]

      position = eval('@' + direction + DIR_MAP[@face.downcase.to_sym][:operator] + '1')

      # Check if the position is on the table?
      if on_the_table?(position)
        instance_variable_set("@#{direction}", position)
      end
    end

    # Turn Left/Right
    def turn(side)
      @face = DIR_MAP[@face.downcase.to_sym][side.downcase.to_sym]
    end

    private

    # @param [Object] position
    def is_valid?(position)
      is_valid_position = [position[0], position[1]].all? do |n|
        on_the_table?(n.to_i)
      end
      is_valid_face = DIR_MAP.keys.map { |k| k.to_s.upcase! }.include? position[2]

      is_valid_face && is_valid_position
    end

    # A method that checks if a given position is on the table?
    def on_the_table?(position)
      position.between?(START_BOUNDARY, END_BOUNDARY)
    end
  end
end
