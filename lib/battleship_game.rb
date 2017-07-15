class BattleshipGame
  attr_reader   :map
  def initialize
    @map = Map.new
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

  def instructions
    "A short explaination on how the game is played."
  end

  def quit
    return "Farewell and following seas!"
  end

  def set_two_unit_ship_location(location)
    locations = convert_location(location)
    first_letter, first_number = split_location_arguments(locations[0])
    second_letter, second_number = split_location_arguments(locations[1])
    valid, orientation = validate_location(location)
    if valid && first_letter == 'A' && second_letter == 'A'
      ship = Ship.new(2, orientation)
      @map.a_grid[locations[0]].add_ship(ship)
      @map.a_grid[locations[1]].add_ship(ship)
    elsif valid && first_letter == 'A' && second_letter == 'B'
      ship = Ship.new(2, orientation)
      @map.a_grid[locations[0]].add_ship(ship)
      @map.b_grid[locations[1]].add_ship(ship)
    end
  end

  def add_ship(grid, orientation, locations)
    ship = ship = Ship.new(2, orientation)
    if first_letter == 'A' && orientation == 'Horizontal'
      @map.a_grid[locations[0]].add_ship(ship)
      @map.a_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'A' && orientation == 'Vertical'
      @map.a_grid[locations[0]].add_ship(ship)
      @map.b_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'B' && orientation == 'Horizontal'
      @map.b_grid[locations[0]].add_ship(ship)
      @map.b_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'B' && orientation == 'Vertical'
      @map.b_grid[locations[0]].add_ship(ship)
      @map.c_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'C' && orientation == 'Horizontal'
      @map.c_grid[locations[0]].add_ship(ship)
      @map.c_grid[locations[1]].add_ship(ship)
    elsif first_letter == 'D' && orientation == 'Horizontal'
      @map.a_grid[locations[0]].add_ship(ship)
      @map.a_grid[locations[1]].add_ship(ship)
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
    if first_number == second_number - 1 && first_number < 4
      true
    elsif second_number == first_number - 1 && second_number < 4
      true
    end
  end

  def valid_vertical_number_pair(first_number, second_number)
    if first_number == second_number && first_number < 4
      true
    end
  end

  #
  # first letter == second letter && first_number == second_number - 1 && first_number < 4
  # first letter == second letter && second_number == first_number - 1 && second_number < 4
  #
  # first letter == 'A' && second letter == 'B' && first number == second_number && first_number < 5
  # first letter == 'B' && second letter == 'C' && first number == second_number && first_number < 5
  # first letter == 'C' && second letter == 'D' && first number == second_number && first_number < 5


  def validate_location(location)
    locations = location.split(' ')
    first_letter, first_number = split_location_arguments(locations[0])
    second_letter, second_number = split_location_arguments(locations[1])
    if first_letter == second_letter && valid_horizontal_number_pair(first_number, second_number)
      return true, 'horizontal'
    elsif valid_vertical_letter_pair(first_letter, second_letter) && first_number == second_number
      return true, 'vertical'
    end
  end

  def convert_location(location)
    location = location.split(' ')
  end

  def split_location_arguments(argument)
    letter = argument[0]
    number = argument[1].to_i
    return letter, number
  end


end
