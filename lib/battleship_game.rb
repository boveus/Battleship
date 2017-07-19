require './lib/ship'
require './lib/map'
require './lib/tile'
require './lib/ship_location_handler'

class BattleshipGame
  attr_reader   :player_one_map,
                :player_two_map,
                :turn,
                :ship_locations

  def initialize
    @computer_tile_choices = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']
    @turn = 'Player1'
    @ship_locations = ShipLocationHandler.new
  end

  def main_menu
    "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def play
    play_prompt_ln1 = "I have laid out my ships on the grid."
    play_prompt_ln2 = "\nYou now need to layout your two ships."
    play_prompt_ln3 = "\nThe first is two units long and the"
    play_prompt_ln4 = "\nsecond is three units long."
    play_prompt_ln5 = "\nThe grid has A1 at the top left and D4 at the bottom right."
    play_prompt_ln6 = "\nEnter the squares for the two-unit ship: "
    play_prompt_ln1 + play_prompt_ln2 + play_prompt_ln3 + play_prompt_ln4 + play_prompt_ln5 + play_prompt_ln6
  end

  def prompt_place_second_ship
    "Please enter the squares for your three-unit ship: "
  end


  def instructions
    "A short explaination on how the game is played."
  end

  def quit
    "Farewell and following seas!"
  end

  def check_tile_valid_firing_location(tile)
    tile =~ /[A-D][1-4]$/
  end

  def computer_choose_random_tile
    @computer_tile_choices.shuffle!
    @computer_tile_choices.pop
  end

  def computer_fire_shot
    tile = computer_choose_random_tile
    if tile[0] == 'A'
      grid = @ship_locations.player_one_map.a_grid
    elsif tile[0] == 'B'
      grid = @ship_locations.player_one_map.b_grid
    elsif tile[0] == 'C'
      grid = @ship_locations.player_one_map.c_grid
    elsif tile[0] == 'D'
      grid = @ship_locations.player_one_map.d_grid
    end
    result = grid[tile].tile_hit
    if result == true
      @turn = 'Player1'
      return "The enemy hit your ship!"
    else
      @turn = 'Player1'
      return "The enemy missed your ships!"
    end
  end


  def player_fire_shot(tile, player = 'Player1')
    if check_tile_valid_firing_location(tile) == nil
      return "Please enter a valid tile to fire upon."
    end
    if tile[0] == 'A'
      grid = @ship_locations.player_two_map.a_grid
    elsif tile[0] == 'B'
      grid = @ship_locations.player_two_map.b_grid
    elsif tile[0] == 'C'
      grid = @ship_locations.player_two_map.c_grid
    elsif tile[0] == 'D'
      grid = @ship_locations.player_two_map.d_grid
    end
    result = grid[tile].tile_hit
    if result == true
      return "You hit the enemy ship!"
    elsif result == false
      return "You missed."
    elsif result == 'Invalid'
      return "You already fired at that space."
    end
  end

  def player_firing_phase
    puts @ship_locations.player_two_map.display
    puts "Please enter a firing solution: "
    input = gets.chomp
    result = player_fire_shot(input)
    puts result + "\n"
    if result == "You already fired at that space." || result == "Please enter a valid tile to fire upon."
        player_firing_phase
    else
      @turn = 'Player2'
    end
  end

  def over
    @turn = 'Over'
  end
end
