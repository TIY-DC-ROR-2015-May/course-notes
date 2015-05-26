require 'minitest/autorun'
require 'pry'

require './player'
require './tic_tac_toe'

class TicTacTest < MiniTest::Test
  def test_new_game
    p1 = Player.new
    p2 = Player.new

    g = TicTacToe.new p1, p2

    assert_equal nil, g.winner
    assert_equal p1, g.current_player
    refute g.over? # assert !g.over?
  end

  def test_can_fill_board
    p1 = Player.new
    p2 = Player.new
    g  = TicTacToe.new p1, p2

    refute g.board_full?

    # Make moves
    (1..9).each do |square|
      g.record_move square
    end
    # g.record_move 1
    # g.record_move 2
    # g.record_move 3
    # g.record_move 4
    # g.record_move 5
    # g.record_move 6
    # g.record_move 7
    # g.record_move 8
    # g.record_move 9

    assert g.board_full?
  end

  def test_can_determine_winner
    # Start a game
    # Play until winner
    # Verify winner
  end
end