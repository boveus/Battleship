require 'simplecov'
require './lib/tile'
require './lib/ship'
require 'minitest/autorun'
require 'minitest/pride'

SimpleCov.start
class TileTest < Minitest::Test
  def test_that_tile_contains_grid
    tile = Tile.new("A1")

    assert_equal "A1", tile.grid
  end

  def test_tile_is_wave_by_default
    tile = Tile.new("A1")

    assert_equal `echo "\xF0\x9F\x8C\x8A"`.strip, tile.icon
  end
  def test_that_tile_contains_no_ship_by_default
    tile = Tile.new("A1")

    assert_nil tile.ship
  end

  def test_if_tile_can_add_ship
    tile = Tile.new("A1")
    ship = Ship.new(3, 'horizontal')
    tile.add_ship(ship)

    assert_instance_of Ship, tile.ship
  end

  def test_if_multiple_tiles_can_contain_same_ship
    tile = Tile.new("A1")
    tile2 = Tile.new("A2")
    ship = Ship.new(2, 'horizontal')
    tile.add_ship(ship)
    tile2.add_ship(ship)

    assert_equal tile.ship, tile2.ship
  end

  def test_if_tile_contains_false_by_default_for_attributes
    tile = Tile.new("A1")

    refute tile.player_hit
    refute tile.player_miss
    refute tile.player2_hit
    refute tile.player2_miss
  end

  def test_set_icon_for_tile
    tile = Tile.new("A1")
    tile.set_icon('wave')
    assert_equal `echo "\xF0\x9F\x8C\x8A"`.strip, tile.icon
    tile.set_icon('ship')
    assert_equal `echo -e "\xF0\x9F\x8E\xAB"`.strip, tile.icon
    tile.set_icon('fire')
    assert_equal `echo -e	"\xF0\x9F\x94\xA5"`.strip, tile.icon
    tile.set_icon('explosion')
    assert_equal `echo -e "\xF0\x9F\x92\xA5"`.strip, tile.icon

  end
end
