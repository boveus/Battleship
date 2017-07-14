class Tile
  attr_reader :grid,
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
  end

  def add_ship(ship)
    @ship = ship
  end
end
