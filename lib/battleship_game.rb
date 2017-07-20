require 'simplecov'
SimpleCov.start
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
    @player_shot_counter = 0
  end

  def player_one_has_set_three_unit_ship
    @ship_locations.player_one_ships.length == 2
  end

  def player_one_has_set_two_unit_ship
    @ship_locations.player_one_ships.length == 1
  end

  def set_three_unit_ship(input, player)
    ship_locations.set_three_unit_ship_location(input, player)
  end

  def player_one_hasnt_set_ship_two
    game.ship_locations.player_one_ships.length  == 1
  end

  def player_one_hasnt_set_ship_one
    @ship_locations.player_one_ships.length == 0
  end

  def set_up_computer_ships
    @ship_locations.set_up_computer_ships
  end

  def set_two_unit_ship(input, player)
    @ship_locations.set_two_unit_ship_location(input, player)
  end
  def player_one_wins
    @ship_locations.player_two_total_health == 0
  end

  def player_two_wins
      @ship_locations.player_one_total_health == 0
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

  def print_player_shots
    "It took you #{@player_shot_counter} shots to defeat the enemy."
  end

  def prompt_place_second_ship
    "Please enter the squares for your three-unit ship: "
  end


  def instructions
    instructions_ln1 = "The game will begin with setting your two tile ship on the grid.\n"
    instructions_ln2 = "The next step will be placing your three tile ship on the grid\n"
    instructions_ln3 = "You must enter your ship coordinates in the following format <A1 B1>\n"
    instructions_ln4 = "The coordinates must also line up in a straight line. Once your ships\n"
    instructions_ln5 = "have been placed, you will be prompted to fire at your opponent's\n"
    instructions_ln6 = "ships. To win, you must sink your opponent's ships before they sink yours.\n"
    instructions_ln7 = "Your hits and misses will be indicated by the following icons\n"
    instructions_ln8 = "A hit is denoated with the fire icon: " + `echo "\xF0\x9F\x94\xA5"`.strip + "\n"
    instructions_ln9 = "A miss is donated with an explosion icon: " + `echo "\xF0\x9F\x92\xA5"`.strip + "\n"
    instructions_ln10 = "Have fun, and remember your Clausewitz!"
    instructions_ln1 + instructions_ln2 + instructions_ln3 + instructions_ln4 + instructions_ln5 + instructions_ln6 + instructions_ln7 + instructions_ln8 + instructions_ln9 + instructions_ln10
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
    if !check_tile_valid_firing_location(tile)
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

  def check_if_player_one_ship_is_sunken
    ship = check_if_ship_is_sunken(@ship_locations.player_one_ships)
    if ship && ship.length == 2
      puts "The computer sank your Patrol Boat!\n"
      @ship_locations.player_one_ships -= [ship]
    elsif ship && ship.length == 3
      puts "The computer sank your Battleship!\n"
      @ship_locations.player_one_ships-= [ship]
    end

  end

  def check_if_player_two_ship_is_sunken
    ship = check_if_ship_is_sunken(@ship_locations.player_two_ships)
    if ship && ship.length == 2
      puts "You sank the computer\'s Patrol Boat\n"
      @ship_locations.player_two_ships -= [ship]
    elsif ship && ship.length == 3
      puts "You sank the computer\'s Battleship!\n"
      @ship_locations.player_two_ships -= [ship]
    end
  end

  def check_if_ship_is_sunken(player_ships, value = false)
    player_ships.each do |ship|
      if ship.is_sunken?
        value = ship
      end
    end
    value
  end

  def player_firing_phase
    puts @ship_locations.player_two_map.display
    puts "Please enter a firing solution: "
    input = gets.chomp
    result = player_fire_shot(input)
    check_if_player_one_ship_is_sunken
    puts result + "\n"
    if result == "You already fired at that space." || result == "Please enter a valid tile to fire upon."
        player_firing_phase
    else
      check_if_player_two_ship_is_sunken
      @player_shot_counter += 1
      @turn = 'Player2'
    end
  end

  def over
    @turn = 'Over'
  end
end
