class Tile
  attr_reader :icon,
              :grid,
              :ship,
              :player_hit,
              :player_miss,
              :player2_hit,
              :player2_miss

  def initialize(grid)
    @grid = grid
    @ship = nil
    @player_hit = false
    @player_miss = false
    @player2_hit = false
    @player2_miss = false
    @icon = `echo "\xF0\x9F\x8C\x8A"`.strip
  end

  def add_ship(ship)
    @ship = ship
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
