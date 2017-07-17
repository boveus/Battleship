require './lib/battleship_game'

  game = BattleshipGame.new
  game.main_menu
  while (input = gets.chomp)
    break if input.upcase == 'Q'
    if input.upcase == 'I'
      puts game.instructions
    elsif input.upcase == 'P'
      puts game.play
      input = gets.chomp
      game.set_ship_location(input, 'Player1')
      puts game.prompt_place_second_ship
      input = gets.chomp
      game.set_ship_location(input, 'Player1')
      puts game.player_one_total_health
    end
  end
  game.quit
