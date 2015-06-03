require './db/setup'
require './lib/all'

require 'pry'

puts "What is your name? "
name = gets.chomp

# User.where(name: name).first_or_create! do |u|
#   u.wins = u.losses = 0
# end
player = User.where(name: name).first
if player
  puts "Welcome back, #{player.name}"
  last_game = player.last_game

  if last_game.nil?
    puts "You ... haven't finished a game?"
  elsif last_game.won?
    puts "You won your last game! #{last_game.word}"
  else
    puts "You lost your last game! #{last_game.word}"
  end
else
  puts "Welcome, new player. Enjoy your game!"
  player = User.create! name: name, wins: 0, losses: 0
end

g = Hangman.new

until g.over?
  puts g.board
  puts "#{g.guesses_left} guesses left | missed #{g.misses.join ','}"

  print "Your guess > "
  guess = gets.chomp
  g.record_guess guess
end

record = Game.create! user_id: player.id, word: g.word
if g.won?
  puts "You win!"
  player.wins += 1
  record.won = true
else
  puts "You lose! The word was #{g.word}"
  player.losses += 1
  record.won = false
end
player.save
record.save

puts "You've won #{player.wins} games and lost #{player.losses}"
