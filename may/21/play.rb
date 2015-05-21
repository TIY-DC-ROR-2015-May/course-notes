require "./game"

game = NumberGuessingGame.new

class Player
  def get_guess
    puts "Enter your guess (1-100) >"
    gets.chomp.to_i
  end
end

player = Player.new

until game.over?
  guess = player.get_guess
  result = game.check_guess guess
  puts "Your guess was: #{result}"
end