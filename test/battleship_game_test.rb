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
    quit_message = "Farewell and following seas!"

    assert_equal quit_message, @game.quit
  end

  def test_set_two_unit_ship_location_horizontal
    @game.set_ship_location('A1 A2', 'Player1')

    assert_instance_of Ship, @game.player_one_map.a_grid['A1'].ship
    assert_instance_of Ship, @game.player_one_map.a_grid['A2'].ship
  end

  def test_set_two_unit_ship_location_vertical
    @game.set_ship_location('A1 B1', 'Player1')
    @game.set_ship_location('B3 C3', 'Player1')
    @game.set_ship_location('C1 D1', 'Player1')

    assert_instance_of Ship, @game.player_one_map.a_grid['A1'].ship
    assert_instance_of Ship, @game.player_one_map.b_grid['B1'].ship
    assert_instance_of Ship, @game.player_one_map.b_grid['B3'].ship
    assert_instance_of Ship, @game.player_one_map.c_grid['C3'].ship
    assert_instance_of Ship, @game.player_one_map.c_grid['C1'].ship
    assert_instance_of Ship, @game.player_one_map.d_grid['D1'].ship
  end

  def test_set_two_unit_ship_invalid_location
    @game.set_ship_location('A1 B3', 'Player1')
    @game.set_ship_location('A1 A1', 'Player1')
    @game.set_ship_location('A4 A5', 'Player1')

    assert_nil @game.player_one_map.a_grid['A1'].ship
    assert_nil @game.player_one_map.b_grid['B3'].ship
  end

  def test_ship_getting_hit
    @game.set_ship_location('A1 A2', 'Player1')
    @game.player_one_map.a_grid['A1'].ship.hit

    assert_equal 1, @game.player_one_map.a_grid['A1'].ship.health
    assert_equal 1, @game.player_one_map.a_grid['A2'].ship.health
  end

  def test_ship_can_sink
    @game.set_ship_location('A1 A2', 'Player1')
    @game.player_one_map.a_grid['A1'].ship.hit
    @game.player_one_map.a_grid['A2'].ship.hit

    assert @game.player_one_map.a_grid['A1'].ship.is_sunken?
    assert @game.player_one_map.a_grid['A2'].ship.is_sunken?
  end

  def test_set_three_unit_ship_location_horizontal
    @game.set_ship_location('A1 A2 A3', 'Player1')

    assert_instance_of Ship, @game.player_one_map.a_grid['A1'].ship
    assert_instance_of Ship, @game.player_one_map.a_grid['A2'].ship
    assert_instance_of Ship, @game.player_one_map.a_grid['A3'].ship
  end

  def test_set_three_unit_ship_location_vertical
    @game.set_ship_location('B1 C1 D1', 'Player1')
    @game.set_ship_location('C2 D2 B2', 'Player1')
    @game.set_ship_location('A1 C4 D3', 'Player1')

    assert_instance_of Ship, @game.player_one_map.b_grid['B1'].ship
    assert_instance_of Ship, @game.player_one_map.c_grid['C1'].ship
    assert_instance_of Ship, @game.player_one_map.d_grid['D1'].ship
    assert_instance_of Ship, @game.player_one_map.b_grid['B2'].ship
    assert_instance_of Ship, @game.player_one_map.c_grid['C2'].ship
    assert_instance_of Ship, @game.player_one_map.d_grid['D2'].ship
    refute_instance_of Ship, @game.player_one_map.a_grid['A1'].ship
    refute_instance_of Ship, @game.player_one_map.c_grid['C4'].ship
    refute_instance_of Ship, @game.player_one_map.d_grid['D3'].ship
  end


  def test_set_three_unit_ship_with_two_unit_in_path
    @game.set_ship_location('A1 A2', 'Player1')
    @game.set_ship_location('A1 A2 A3', 'Player1')
    @game.set_ship_location('A2 A3 A4', 'Player1')
    @game.set_ship_location('B1 B2 B3', 'Player1')

    assert_instance_of Ship, @game.player_one_map.a_grid['A1'].ship
    assert_instance_of Ship, @game.player_one_map.a_grid['A2'].ship
    refute_instance_of Ship, @game.player_one_map.a_grid['A3'].ship
    refute_instance_of Ship, @game.player_one_map.a_grid['A4'].ship
    assert_instance_of Ship, @game.player_one_map.b_grid['B1'].ship
  end

  def test_sinking_all_the_ships
    @game.set_ship_location('A1 A2', 'Player1')
    @game.set_ship_location('B1 B2 B3', 'Player1')
    @game.player_one_map.a_grid['A1'].ship.hit
    @game.player_one_map.a_grid['A2'].ship.hit
    @game.player_one_map.b_grid['B1'].ship.hit
    @game.player_one_map.b_grid['B2'].ship.hit
    @game.player_one_map.b_grid['B3'].ship.hit

    assert_equal 0, @game.player_one_total_health
  end
end
