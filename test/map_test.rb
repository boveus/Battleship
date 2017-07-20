require 'simplecov'
SimpleCov.start
require './lib/map'
require './lib/tile'
require './lib/ship'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class MapTest < Minitest::Test

  def test_map_can_display
    map = Map.new
    wave = `echo "\xF0\x9F\x8C\x8A"`.strip
    border = "===========\n"
    line1 = ". 1 2 3 4 \n"
    line2 = "A #{wave} #{wave} #{wave} #{wave}\n"
    line3 = "B #{wave} #{wave} #{wave} #{wave}\n"
    line4 = "C #{wave} #{wave} #{wave} #{wave}\n"
    line5 = "D #{wave} #{wave} #{wave} #{wave}\n"
    bottom_border = "==========="
    map.render_lines
    map_display = border + line1 + line2 + line3 + line4 + line5 + bottom_border
    assert_equal map_display, map.display
  end

  def test_map_can_display_ships
    map = Map.new
    wave = `echo "\xF0\x9F\x8C\x8A"`.strip
    ship = `echo "\xF0\x9F\x8E\xAB"`.strip
    border = "===========\n"
    line1 = ". 1 2 3 4 \n"
    line2 = "A #{wave} #{ship} #{ship} #{wave}\n"
    line3 = "B #{wave} #{wave} #{wave} #{wave}\n"
    line4 = "C #{wave} #{wave} #{wave} #{wave}\n"
    line5 = "D #{wave} #{wave} #{wave} #{wave}\n"
    bottom_border = "==========="
    map.render_lines
    map.a_grid['A2'].set_icon('ship')
    map.a_grid['A3'].set_icon('ship')
    map_display = border + line1 + line2 + line3 + line4 + line5 + bottom_border

    assert_equal map_display, map.display
  end

  def test_map_can_display_ships_that_are_on_fire
    map = Map.new
    wave = `echo "\xF0\x9F\x8C\x8A"`.strip
    ship = `echo "\xF0\x9F\x8E\xAB"`.strip
    fire = `echo "\xF0\x9F\x94\xA5"`.strip
    border = "===========\n"
    line1 = ". 1 2 3 4 \n"
    line2 = "A #{wave} #{ship} #{fire} #{wave}\n"
    line3 = "B #{wave} #{wave} #{wave} #{wave}\n"
    line4 = "C #{wave} #{wave} #{wave} #{wave}\n"
    line5 = "D #{wave} #{wave} #{wave} #{wave}\n"
    bottom_border = "==========="
    map.render_lines
    map.a_grid['A2'].set_icon('ship')
    map.a_grid['A3'].set_icon('fire')
    map_display = border + line1 + line2 + line3 + line4 + line5 + bottom_border

    assert_equal map_display, map.display
  end
end
