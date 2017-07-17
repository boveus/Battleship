require './lib/battleship_game'

  game = BattleshipGame.new
  puts game.main_menu
  while (input = gets.chomp)
    break if input.upcase == 'Q'
    if input.upcase == 'I'
      puts game.instructions
    elsif input.upcase == 'P'
      puts game.play
      while game.player_one_ships.length == 0
      input = gets.chomp
      game.set_two_unit_ship_location(input, 'Player1')
      break if game.player_one_ships.length == 1
      puts "Please enter a valid ship location."
      end
      while game.player_one_ships.length == 1
      puts game.prompt_place_second_ship
      input = gets.chomp
      game.set_three_unit_ship_location(input, 'Player1')
      break if game.player_one_ships.length == 2
      puts "Please enter a valid ship location."
      end
      puts game.player_one_map.display
    end
  end
  game.quit
