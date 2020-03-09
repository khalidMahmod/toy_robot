require "./test/test_helper"

##
# Toy Robot tests
class ToyRobotTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ToyRobot::VERSION
  end

  ##
  # Test behavior of the Toy Robot for valid commands
  describe 'valid_commands' do
    def setup
      @robot = ToyRobot::Robot.new
    end

    # it initializes the toy robot
    def test_initializes_the_robot
      assert_equal @robot.instance_variable_get(:@face), 'UNKNOWN'
      assert_equal @robot.instance_variable_get(:@x), -1
      assert_equal @robot.instance_variable_get(:@is_placed), false
    end

    # Toy Robot Module executes its main method to take user input
    def test_takes_user_inputs
      assert ToyRobot.respond_to?(:main)
    end

    # it moves 1 step north successfully
    def test_robot_moves_successfully
      @robot.place('PLACE 0,0,NORTH')
      @robot.process('MOVE')
      assert_output(@robot.process('REPORT')) { '0,0,NORTH' }
    end

    # it turns left successfully
    def test_robot_turns_left_successfully
      @robot.place('PLACE 0,0,NORTH')
      @robot.process('LEFT')
      assert_output(@robot.process('REPORT')) { '0,0,WEST' }
    end

    # it checks that multiple PLACE command works successfully
    def test_multiple_place_command
      @robot.place('PLACE 2,4,EAST')
      @robot.process('LEFT')
      @robot.process('RIGHT')
      @robot.process('MOVE')
      @robot.place('PLACE 3,1,SOUTH')
      @robot.process('LEFT')
      assert_output(@robot.process('REPORT')) { '2,1,EAST' }
    end

    # The robot can move and turn successfully
    def test_robot_moves_and_turns_successfully
      @robot.place('PLACE 1,2,EAST')
      @robot.process('MOVE')
      @robot.process('MOVE')
      @robot.process('LEFT')
      @robot.process('MOVE')
      assert_output(@robot.process('REPORT')) { '3,3,NORTH' }
    end
  end

  ##
  # Test behavior of the Toy Robot for invalid commands
  describe 'invalid_commands' do
    # Create another toy robot instance
    def setup
      @another_robot = ToyRobot::Robot.new
    end

    # it checks invalid commands should be ignored
    def test_invalid_position_does_not_do_anything
      @another_robot.place('PLACE 0,0,NORHT')
      assert_output(@another_robot.process('REPORT')) { nil }

      @another_robot.place('PLACE -1,0,NORTH')
      @another_robot.process('MOVE')
      assert_output(@another_robot.process('REPORT')) { nil }

      @another_robot.place('PLACE 4,5,NORTH')
      @another_robot.process('LEFT')
      @another_robot.process('RIGHT')
      assert_output(@another_robot.process('REPORT')) { nil }
    end

    # invalid commands before placing into table should be ignored
    def test_invalid_commands_before_placing_into_table
      @another_robot.process('MOVE')
      @another_robot.process('LEFT')
      @another_robot.process('RIGHT')
      @another_robot.process('MOVE')
      assert_output(@another_robot.process('REPORT')) { nil }
    end
  end
end
