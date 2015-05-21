require 'minitest/autorun'

require './game'

class GameTest < MiniTest::Test
  def test_games_arent_over_when_they_start
    g = NumberGuessingGame.new
    assert_equal g.over?, false
    # refute g.over?
  end

  # Games are over after you win
  # Games are over after you run out of tries
end