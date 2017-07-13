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
    play_prompt_ln1 = "I have laid out my ships on the grid."
    play_prompt_ln2 = "\nYou now need to layout your two ships."
    play_prompt_ln3 = "\nThe first is two units long and the"
    play_prompt_ln4 = "\nsecond is three units long."
    play_prompt_ln5 = "\nThe grid has A1 at the top left and D4 at the bottom right."
    play_prompt_ln6 = "\nEnter the squares for the two-unit ship: "

    play_prompt = play_prompt_ln1 + play_prompt_ln2 + play_prompt_ln3 + play_prompt_ln4 + play_prompt_ln5 + play_prompt_ln6

    assert_equal play_prompt, @game.play
  end

  def test_main_menu_instructions
    instructions_prompt = "A short explaination on how the game is played."

    assert_equal instructions_prompt, @game.instructions
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
