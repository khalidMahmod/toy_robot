require "./test/test_helper"

class ToyRobotTest < Minitest::Test
  def setup
    @robot = ToyRobot::Robot.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::ToyRobot::VERSION
  end

  def test_initializes_the_robot
    assert_equal @robot.instance_variable_get(:@face), 'UNKNOWN'
    assert_equal @robot.instance_variable_get(:@x), -1
    assert_equal @robot.instance_variable_get(:@is_placed), false
  end

  def test_takes_user_inputs
    assert ToyRobot.respond_to?(:main)
  end

  def test_robot_moves_successfully
    @robot.place('PLACE 0,0,NORTH')
    @robot.process_command('MOVE')
    assert_output(@robot.process_command('REPORT')) { '0,0,NORTH' }
  end

  def test_robot_turns_left_successfully
    @robot.place('PLACE 0,0,NORTH')
    @robot.process_command('LEFT')
    assert_output(@robot.process_command('REPORT')) { '0,0,WEST' }
  end

  def test_robot_moves_and_turns_successfully
    @robot.place('PLACE 1,2,EAST')
    @robot.process_command('MOVE')
    @robot.process_command('MOVE')
    @robot.process_command('LEFT')
    @robot.process_command('MOVE')
    assert_output(@robot.process_command('REPORT')) { '3,3,NORTH' }
  end
end
