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

  def set_two_unit_ship_location(location)
    locations = convert_location(location)
    first_letter, first_number = split_location_arguments(locations[0])
    second_letter, second_number = split_location_arguments(locations[1])
    ship = Ship.new(2, 'horizontal')
    @map.a_grid[first_number - 1].add_ship(ship)
    @map.a_grid[second_number - 1].add_ship(ship)
    @map.a_grid[first_number - 1].set_icon('ship')
    @map.a_grid[second_number - 1].set_icon('ship')
  end

  def convert_location(location)
    location = location.split(' ')
  end

  def split_location_arguments(argument)
    letter = argument[0]
    number = argument[1].to_i
    return letter, number
  end

  def instructions
    "A short explaination on how the game is played."
  end

  def quit
    return "Farewell and following seas!"
  end
end
