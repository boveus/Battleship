require 'simplecov'
require './lib/map'
require './lib/tile'
require './lib/ship'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

SimpleCov.start
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

  map_display = border + line1 + line2 + line3 + line4 + line5 + bottom_border
  assert_equal map_display, map.display
end

def test_map_can_display_ships

end



end
