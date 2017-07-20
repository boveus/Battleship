require './lib/ship'
require 'minitest/autorun'
require 'minitest/pride'

class ShipTest < Minitest::Test
  def test_ship_takes_length_initialize_argument
    ship = Ship.new(2, 'horizontal')

    assert_equal 2, ship.length
  end

  def test_ship_takes_orientation_initialize_argument
    ship = Ship.new(2, 'horizontal')
    ship2 = Ship.new(2, 'vertical')

    assert_equal 'horizontal', ship.orientation
    assert_equal 'vertical', ship2.orientation
  end

  def test_ship_health_starts_full
    ship = Ship.new(3, 'horizontal')

    assert_equal 3, ship.health
  end

  def test_ship_gettting_hit_reduces_health
    ship = Ship.new(3, 'horizontal')
    ship.hit

    assert_equal 2, ship.health
  end

  def test_ship_health_zero_makes_it_sink
    ship = Ship.new(3, 'horizontal')
    ship.hit
    ship.hit
    ship.hit

    assert ship.is_sunken?
  end
end
