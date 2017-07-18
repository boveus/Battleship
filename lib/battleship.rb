require './lib/battleship_game'

  game = BattleshipGame.new
  puts game.main_menu
  while (input = gets.chomp)
  break if input.upcase == 'Q'
    if input.upcase == 'I'
      puts game.instructions
    elsif input.upcase == 'P'
      game.set_up_computer_ships('Player2')
      puts game.play
      while game.player_one_ships.length == 0
        input = gets.chomp
        game.set_two_unit_ship_location(input, 'Player1')
        break if game.player_one_ships.length == 1
          puts "Please enter a valid ship location for your two unit ship."
      end
      puts game.prompt_place_second_ship
      while game.player_one_ships.length == 1
        input = gets.chomp
        game.set_three_unit_ship_location(input, 'Player1')
        break if game.player_one_ships.length == 2
          puts "Please enter a valid ship location for your three unit ship."
      end
      while game.player_two_total_health > 0 && game.player_one_total_health > 0
        if game.turn == 'Player1'
        game.player_firing_phase(game)
        elsif game.turn == 'Player2'
          puts game.computer_fire_shot
        end
      end
    end
  end
  game.quit
