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
end
