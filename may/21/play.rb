require "./game"

game = NumberGuessingGame.new

class Player
  def get_guess
    puts "Enter your guess (1-100) >"
    gets.chomp.to_i
  end
end

class BadComputerPlayer
  def get_guess
    guess = rand 1..100
    puts "Guessing #{guess}"
    return guess
  end
end

#player = Player.new
player = BadComputerPlayer.new

until game.over?
  guess = player.get_guess
  result = game.check_guess guess
  puts "Your guess was: #{result}"
end

if game.won?
  puts "Congrats! You're awesome."
elsif game.lost?
  puts "You're a terrible human being."
  puts "The answer was #{game.answer}, obviously"
end