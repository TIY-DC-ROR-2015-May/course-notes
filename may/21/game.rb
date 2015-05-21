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
    @user_has_won || @tries.zero?
  end

  def check_guess guess
    if guess < @answer
      return :low
    elsif guess == @answer
      return :correct!
    else
      return :high
    end
  end
end