require 'simplecov'
require './lib/map'
require './lib/tile'
require './lib/ship'
require 'minitest/autorun'
require 'minitest/pride'

SimpleCov.start
class MapTest < Minitest::Test

def test_map_can_display
  map = Map.new
  border = "===========\n"
  line1 = ". 1 2 3 4 \n"
  line2 = "A\n"
  line3 = "B\n"
  line4 = "C\n"
  line5 = "D\n"
  bottom_border = "==========="

  map_display = border + line1 + line2 + line3 + line4 + line5 + bottom_border

  assert_equal map_display, map.display
end


end
