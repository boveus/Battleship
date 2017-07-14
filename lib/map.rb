class Map
  # initialize map with new tile objects
  attr_reader      :a_grid,
                   :b_grid,
                   :c_grid,
                   :d_grid

  def initialize(a_grid = [], b_grid = [], c_grid = [], d_grid = [])
    @a_grid = a_grid << Tile.new('A1') << Tile.new('A2') << Tile.new('A3') << Tile.new('A4')
    @b_grid = b_grid << Tile.new('B1') << Tile.new('B2') << Tile.new('B3') << Tile.new('B4')
    @c_grid = c_grid << Tile.new('C1') << Tile.new('C2') << Tile.new('C3') << Tile.new('C4')
    @d_grid = d_grid << Tile.new('D1') << Tile.new('D2') << Tile.new('D3') << Tile.new('D4')
    @border = "===========\n"
    @line1 = ". 1 2 3 4 \n"
    @line2 = "A " + @a_grid[0].icon + " " + @a_grid[1].icon + " " + @a_grid[2].icon + " " + @a_grid[3].icon + "\n"
    @line3 = "B " + @b_grid[0].icon + " " + @b_grid[1].icon + " " + @b_grid[2].icon + " " + @b_grid[3].icon + "\n"
    @line4 = "C " + @c_grid[0].icon + " " + @c_grid[1].icon + " " + @c_grid[2].icon + " " + @c_grid[3].icon + "\n"
    @line5 = "D " + @d_grid[0].icon + " " + @d_grid[1].icon + " " + @d_grid[2].icon + " " + @d_grid[3].icon + "\n"
    @bottom_border = "==========="
    @map_display = @border + @line1 + @line2 + @line3 + @line4 + @line5 + @bottom_border
  end
  def display
    @map_display
  end
end
