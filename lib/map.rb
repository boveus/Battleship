require 'simplecov'
SimpleCov.start
require './lib/tile'


class Map
  attr_reader      :a_grid,
                   :b_grid,
                   :c_grid,
                   :d_grid

  def initialize
    @a_grid = {}
    @b_grid = {}
    @c_grid = {}
    @d_grid = {}
    @border = "===========\n"
    @line1 = ". 1 2 3 4 \n"
    @line2 = ''
    @line3 = ''
    @line4 = ''
    @line5 = ''
    @bottom_border = "==========="
    initialize_tiles
  end

  def initialize_tiles
    a_values = ['A1', 'A2', 'A3', 'A4']
    a_values.each do |grid_value|
      @a_grid[grid_value] = Tile.new
    end

    b_values = ['B1', 'B2', 'B3', 'B4']
    b_values.each do |grid_value|
      @b_grid[grid_value] = Tile.new
    end

    c_values = ['C1', 'C2', 'C3', 'C4']
    c_values.each do |grid_value|
      @c_grid[grid_value] = Tile.new
    end

    d_values = ['D1', 'D2', 'D3', 'D4']
    d_values.each do |grid_value|
      @d_grid[grid_value] = Tile.new
    end
  end

  def display
    render_lines
    @border + @line1 + @line2 + @line3 + @line4 + @line5 + @bottom_border
  end

  def render_lines
    @line2 = "A " + a_grid['A1'].icon + " " + a_grid['A2'].icon + " " + a_grid['A3'].icon + " " + a_grid['A4'].icon + "\n"
    @line3 = "B " + b_grid['B1'].icon + " " + b_grid['B2'].icon + " " + b_grid['B3'].icon + " " + b_grid['B4'].icon + "\n"
    @line4 = "C " + c_grid['C1'].icon + " " + c_grid['C2'].icon + " " + c_grid['C3'].icon + " " + c_grid['C4'].icon + "\n"
    @line5 = "D " + d_grid['D1'].icon + " " + d_grid['D2'].icon + " " + d_grid['D3'].icon + " " + d_grid['D4'].icon + "\n"
  end
end
