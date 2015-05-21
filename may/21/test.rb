require 'minitest/autorun'
require 'pry'

require './game'

class GameTest < MiniTest::Test
  def test_games_arent_over_when_they_start
    g = NumberGuessingGame.new
    assert_equal g.over?, false
    # refute g.over?
  end

  def test_game_can_check_wrong_guess
    g = NumberGuessingGame.new
    answer = g.answer
    result = g.check_guess(answer + 1)
    assert_equal result, :high
  end

  # Games are over after you win
  # Games are over after you run out of tries
end