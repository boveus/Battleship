require './lib/ship'
require './lib/map'
require './lib/tile'

class BattleshipGame
  attr_reader   :player_one_map,
                :player_two_map,
                :player_one_total_health,
                :player_two_total_health

  def initialize
    @player_one_map = Map.new
    @player_two_map = Map.new
    @player_one_ships = []
    @player_two_ships = []
    @player_one_total_health = player_total_ship_health(@player_one_ships)
    @player_two_total_health = player_total_ship_health(@player_two_ships)
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

  def set_two_unit_ship_location(location, player, map = '')
    if player == 'Player1'
      map = @player_one_map
      ship_list = @player_one_ships
    elsif player == 'Player2'
      map = @player_two_map
      ship_list = @player_one_ships
    end
    locations = convert_location(location)
    first_letter, first_number = split_location_arguments(locations[0])
    valid, orientation = validate_location_two_unit(location)
    if valid && locations.count == 2
      ship = Ship.new(2, orientation)
      ship_list << ship
      add_two_unit_ship(first_letter, orientation, locations, map, ship)
    end
  end

  def set_three_unit_ship_location(location, player, map = '')
    if player == 'Player1'
      map = @player_one_map
      ship_list = @player_one_ships
    elsif player == 'Player2'
      map = @player_two_map
      ship_list = @player_one_ships
    end
    locations = convert_location(location)
    first_letter, first_number = split_location_arguments(locations[0])
    valid, orientation = validate_location_three_unit(location)
    if valid
      ship = Ship.new(3, orientation)
      ship_list.push(ship)
      add_three_unit_ship(first_letter, first_number, orientation, locations, map, ship)
    end
  end

  def add_two_unit_ship(first_letter, orientation, locations, map, ship)
    if first_letter == 'A' && orientation == 'Horizontal'
      map.a_grid[locations[0]].add_ship(ship)
      map.a_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'A' && orientation == 'Vertical'
      map.a_grid[locations[0]].add_ship(ship)
      map.b_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'B' && orientation == 'Horizontal'
      map.b_grid[locations[0]].add_ship(ship)
      map.b_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'B' && orientation == 'Vertical'
      map.b_grid[locations[0]].add_ship(ship)
      map.c_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'C' && orientation == 'Horizontal'
      map.c_grid[locations[0]].add_ship(ship)
      map.c_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'C' && orientation == 'Vertical'
      map.c_grid[locations[0]].add_ship(ship)
      map.d_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'D' && orientation == 'Horizontal'
      map.a_grid[locations[0]].add_ship(ship)
      map.a_grid[locations[1]].add_ship(ship)
    end
  end

  def add_three_unit_ship(first_letter, first_number, orientation, locations, map, ship)
    if first_letter == 'A' && orientation == 'Horizontal' && check_horizontal_for_ship(locations, first_letter, map)
      map.a_grid[locations[0]].add_ship(ship)
      map.a_grid[locations[1]].add_ship(ship)
      map.a_grid[locations[2]].add_ship(ship)
    elsif first_letter == 'A' && orientation == 'Vertical' && check_vertical_for_ship(locations, first_number, first_letter, map)
      map.a_grid[locations[0]].add_ship(ship)
      map.b_grid[locations[1]].add_ship(ship)
      map.c_grid[locations[2]].add_ship(ship)
    elsif first_letter == 'B' && orientation == 'Horizontal' && check_horizontal_for_ship(locations, first_letter, map)
      map.b_grid[locations[0]].add_ship(ship)
      map.b_grid[locations[1]].add_ship(ship)
      map.b_grid[locations[2]].add_ship(ship)
    elsif first_letter == 'B' && orientation == 'Vertical' && check_vertical_for_ship(locations, first_number, first_letter, map)
      map.b_grid[locations[0]].add_ship(ship)
      map.c_grid[locations[1]].add_ship(ship)
      map.d_grid[locations[2]].add_ship(ship)
    elsif first_letter == 'C' && orientation == 'Horizontal' && check_horizontal_for_ship(locations, first_letter, map)
      map.c_grid[locations[0]].add_ship(ship)
      map.c_grid[locations[1]].add_ship(ship)
      map.c_grid[locations[2]].add_ship(ship)
    elsif first_letter == 'D' && orientation == 'Horizontal' && check_horizontal_for_ship(locations, first_letter, map)
      map.d_grid[locations[0]].add_ship(ship)
      map.d_grid[locations[1]].add_ship(ship)
      map.d_grid[locations[2]].add_ship(ship)
    end
  end

  def check_vertical_for_ship(locations, number, letter, map)
    if letter == 'A'
       map.a_grid[locations[0]].ship == nil && map.b_grid[locations[1]].ship == nil && map.c_grid[locations[2]].ship == nil
    elsif letter == 'B'
      map.b_grid[locations[0]].ship == nil && map.c_grid[locations[1]].ship == nil && map.d_grid[locations[2]].ship == nil
    end
  end

  def check_horizontal_for_ship(locations, letter, map)
    if letter == 'A'
    locations.all? do |location|
       map.a_grid[location].ship == nil
    end
    elsif letter == 'B'
      locations.all? do |location|
         map.b_grid[location].ship == nil
      end
    elsif letter == 'C'
      locations.all? do |location|
         map.c_grid[location].ship == nil
      end
    elsif letter == 'D'
      locations.all? do |location|
         map.d_grid[location].ship == nil
      end
    end
  end

  def valid_vertical_letter_pair(first_letter, second_letter)
    if first_letter == 'A' && second_letter == 'B'
      true
    elsif first_letter == 'B' && second_letter == 'C'
      true
    elsif first_letter == 'C' && second_letter == 'D'
      true
    end
  end

  def valid_horizontal_number_pair(first_number, second_number)
    first_number == second_number - 1 && first_number < 4
  end

  def valid_horizontal_three_number(first_number, second_number, third_number)
    first_number == second_number - 1 && second_number == third_number - 1 && first_number < 3
  end


  def validate_location_two_unit(location)
    locations = location.split(' ')
    first_letter, first_number = split_location_arguments(locations[0])
    second_letter, second_number = split_location_arguments(locations[1])
    if first_letter == second_letter && valid_horizontal_number_pair(first_number, second_number)
      return true, 'Horizontal'
    elsif valid_vertical_letter_pair(first_letter, second_letter) && first_number == second_number
      return true, 'Vertical'
    end
  end

  def validate_location_three_unit(location)
    locations = location.split(' ')
    first_letter, first_number = split_location_arguments(locations[0])
    second_letter, second_number = split_location_arguments(locations[1])
    third_letter, third_number = split_location_arguments(locations[2])
    if first_letter == second_letter && valid_horizontal_three_number(first_number, second_number, third_number)
      return true, 'Horizontal'
    elsif valid_vertical_letter_pair(first_letter, second_letter) && three_numbers_valid(first_number, second_number, third_number)
      return true, 'Vertical'
    end
  end

  def three_numbers_valid(first_number, second_number, third_number)
    valid_vertical_number_pair(first_number, second_number) && second_number == third_number
  end

  def valid_vertical_number_pair(first_number, second_number)
    if first_number == second_number && first_number < 4
      true
    end
  end

  def convert_location(location)
    location.split(' ').sort
  end

  def split_location_arguments(argument)
    letter = argument[0]
    number = argument[1].to_i
    return letter, number
  end

  def player_total_ship_health(array, total = 0)
    array.each do |ship|
      total += ship.health
    end
    total
  end
end
