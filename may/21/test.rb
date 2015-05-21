require 'minitest/autorun'
require 'pry'

require './game'

class GameTest < MiniTest::Test
  def test_games_arent_over_when_they_start
    g = NumberGuessingGame.new
    assert_equal g.over?, false
    # refute g.over?
  end

  def test_game_is_over_after_you_win
    n = NumberGuessingGame.new
    # you win ...
    result = n.check_guess n.answer
    assert_equal result, :correct!
    assert n.over?
  end

  def test_game_can_check_wrong_guess
    g = NumberGuessingGame.new
    answer = g.answer
    result = g.check_guess(answer + 1)
    assert_equal result, :high
  end

  def test_players_can_lose
    g = NumberGuessingGame.new
    answer = g.answer
    5.times do
      g.check_guess(answer + 1)
    end
    assert g.over?
  end

  # Games are over after you run out of tries
end