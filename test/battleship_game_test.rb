require 'simplecov'
require './lib/battleship'
require './lib/battleship_game'
require 'minitest/autorun'
require 'minitest/pride'

SimpleCov.start
class BattleshipGameTest < Minitest::Test
  def setup
    @game = BattleshipGame.new
  end

  def test_main_menu_displays
    main_menu_text = "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    assert_equal main_menu_text, @game.main_menu
  end

  def test_main_menu_play
  end

  def test_main_menu_instructions
  end

  def test_main_menu_quit
  end
end





# You are to build a playable game of Battleship that runs in a REPL interface.
# The game will allow a single human player to play against a (simplistic) computer player.
#
# The game will include several distinct phases:
#
#
# The player starts the game by running ruby battleship.rb from within your project directory
# Then they see:
# Welcome to BATTLESHIP
#
# Would you like to (p)lay, read the (i)nstructions, or (q)uit?
# >
# If they enter p or play then they enter the ship layout described below.
# If they enter i or instructions they should be presented with a short explanation of how the game is played.
# If they enter q or quit then the game should exit
