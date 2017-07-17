require './lib/battleship_game'

  game = BattleshipGame.new
  game.main_menu
  while (input = gets.chomp)
    break if input.upcase == 'Q'
    if input.upcase == 'I'
      game.instructions
    elsif input.upcase == 'P'
      game.play
      input = gets.chomp
      game.set_ship_location(input, 'Player1')
      game.prompt_place_second_ship
      input = gets.chomp
      game.set_ship_location(input, 'Player1')
      print game.player_two_total_health
    end
  end
  game.quit
