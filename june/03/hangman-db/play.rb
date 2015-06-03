require './hangman'
require 'pry'

puts "What is your name? "
name = gets.chomp

player = User.create name: name
g = Hangman.new

until g.over?
  puts g.board
  puts "#{g.guesses_left} guesses left | missed #{g.misses.join ','}"

  print "Your guess > "
  guess = gets.chomp
  g.record_guess guess
end

if g.won?
  puts "You win!"
  player.wins += 1
else
  puts "You lose! The word was #{g.word}"
  player.losses += 1
end