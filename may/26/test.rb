require 'minitest/autorun'
require 'pry'

require './player'
require './tic_tac_toe'

class TicTacTest < MiniTest::Test
  def test_no_one_has_won_at_start
    p1 = Player.new
    p2 = Player.new

    g = TicTacToe.new p1, p2
    
    assert_equal nil, g.winner
    assert_equal p1, g.current_player
  end

  def test_can_determine_winner
    # Start a game
    # Play until winner
    # Verify winner
  end
end