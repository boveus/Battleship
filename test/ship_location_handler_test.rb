require './lib/ship_location_handler'
require 'minitest/autorun'
require 'minitest/pride'


class ShipLocationHandlerTest < Minitest::Test
  def setup
    @handler = ShipLocationHandler.new
  end
  def set_up_computer_ships_test
    @handler.set_up_computer_ships

    assert @handler.player_two_ships.length > 1
  end

  def test_randomize
    expected_1 = @handler.randomize(2)
    expected_2 = @handler.randomize(3)

    assert expected_1.length > 4
    assert expected_2.length > 6
  end

  def test_set_two_unit_ship_location
    @handler.set_two_unit_ship_location('A1 A2', 'Player1')

    assert @handler.player_one_ships.length > 0
  end


  def test_set_two_unit_ship_location
    @handler.set_three_unit_ship_location('A1 A2 A3', 'Player1')

    assert @handler.player_one_ships.length > 0
  end

  def test_check_three_unit_positions
    test_1 = @handler.check_two_unit_positions('A1 A2')
    test_2 = @handler.check_two_unit_positions('A1 A2 A3')
    assert_equal 0, test_1
    refute_equal 0, test_2
  end

  def test_check_two_unit_positions
    test_1 = @handler.check_three_unit_positions('A1 A2')
    test_2 = @handler.check_three_unit_positions('A1 A2 A3')
    refute_equal 0, test_1
    assert_equal 0, test_2
  end
end
