require './lib/battleship_game'

  game = BattleshipGame.new
  puts game.main_menu
  while (input = gets.chomp)
  break if input.upcase == 'Q'
    if input.upcase == 'I'
      puts game.instructions
    elsif input.upcase == 'P'
      game.set_up_computer_ships
      puts game.play
      while game.player_one_hasnt_set_ship_one
      break if input.upcase == 'Q'
        input = gets.chomp
        game.set_two_unit_ship(input, 'Player1')
        break if game.player_one_has_set_two_unit_ship
          puts "Please enter a valid ship location for your two unit ship."
      end
      puts game.prompt_place_second_ship
      while game.player_one_has_set_two_unit_ship
        break if input.upcase == 'Q'
          input = gets.chomp
          game.set_three_unit_ship(input, 'Player1')
          break if game.player_one_has_set_three_unit_ship
            puts "Please enter a valid ship location for your three unit ship."
      end
      while game.turn != 'Over'
        if game.player_two_wins
          print "YOU LOSE - FOR SHAME. THE ADMIRALCY WILL HEAR OF THIS."
          game.over
          break
        elsif game.turn == 'Player1'
          game.player_firing_phase
        elsif game.player_one_wins
          print "YOU WIN - ADMIRAL NIMITZ WOULD BE PROUD\n"
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
