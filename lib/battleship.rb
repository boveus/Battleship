require './lib/battleship_game'

  game = BattleshipGame.new
  puts game.main_menu
  while (input = gets.chomp)
  break if input.upcase == 'Q'
    if input.upcase == 'I'
      puts game.instructions
    elsif input.upcase == 'P'
      game.ship_locations.set_up_computer_ships
      puts game.play
      while game.ship_locations.player_one_ships.length == 0
      break if input.upcase == 'Q'
        input = gets.chomp
        game.ship_locations.set_two_unit_ship_location(input, 'Player1')
        break if game.ship_locations.player_one_ships.length == 1
          puts "Please enter a valid ship location for your two unit ship."
      end
      puts game.prompt_place_second_ship
      while game.ship_locations.player_one_ships.length == 1
        break if input.upcase == 'Q'
          input = gets.chomp
          game.ship_locations.set_three_unit_ship_location(input, 'Player1')
          break if game.ship_locations.player_one_ships.length == 2
            puts "Please enter a valid ship location for your three unit ship."
      end
      while game.turn != 'Over'
        if game.player_two_wins
          print "YOU LOSE"
          game.over
          break
        elsif game.turn == 'Player1'
          game.player_firing_phase
        elsif game.player_one_wins
          print "YOU WIN\n"
          puts game.print_player_shots
          game.over
          break
        elsif game.turn == 'Player2'
          puts game.computer_fire_shot
        end
      end
      game.quit
    end
  end
