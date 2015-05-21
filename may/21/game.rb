class NumberGuessingGame
  attr_reader :answer
  # def answer
  #   @answer
  # end

  def initialize
    @answer = rand(1..100)
    @user_has_won = false
    @tries = 5
  end

  def over?
    #@user_has_won || @tries.zero?
    won? || lost?
  end

  def won?
    @user_has_won
  end

  def lost?
    @tries.zero?
  end

  def check_guess guess
    @tries -= 1
    if guess < @answer
      return :low
    elsif guess == @answer
      @user_has_won = true
      return :correct!
    else
      return :high
    end
  end
end