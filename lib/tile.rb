require 'simplecov'
SimpleCov.start

class Tile
  attr_reader :icon,
              :grid,
              :ship,
              :opponent_hit,
              :opponent_miss

  def initialize
    @ship = nil
    @opponent_hit = false
    @opponent_miss = false
    @icon = `echo "\xF0\x9F\x8C\x8A"`.strip
  end

  def tile_hit
    if @ship != nil && @opponent_hit == false
      @opponent_hit = true
      set_icon('fire')
      @ship.hit
      true
    elsif @ship == nil && @opponent_miss == false
      @opponent_miss = true
      set_icon('explosion')
      false
    else
      'Invalid'
    end
  end

  def add_ship(ship)
    @ship = ship
    # set_icon('ship')
  end

  def set_icon(icon)
    if icon == 'wave'
      @icon = `echo "\xF0\x9F\x8C\x8A"`.strip
    elsif icon == 'ship'
      @icon = `echo "\xF0\x9F\x8E\xAB"`.strip
    elsif icon == 'fire'
      @icon = `echo "\xF0\x9F\x94\xA5"`.strip
    elsif icon == 'explosion'
      @icon = `echo "\xF0\x9F\x92\xA5"`.strip
    end
  end
end
