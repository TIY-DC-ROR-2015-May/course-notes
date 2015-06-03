require './hangman'
require 'pry'

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
else
  puts "You lose! The word was #{g.word}"
end