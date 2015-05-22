require 'pry'

# -- Set up game --

list = ["banana", "table", "awesome"]
#word = list.sample
word = list.first
letters_in_word = word.split("") # word.chars
tries = 5

# ["_"] * word.length

board = [] # Array of underscores
letters_in_word.each do |letter|
  board.push "_"
end


# -- Start taking player input --

print "Pick a letter > "
guess = gets.chomp

# -- Check guess --

have_seen_a_match = false

letters_in_word.each do |letter|
  if letter == guess
    # dunno ... come back to it
    have_seen_a_match = true
    # also, update the board
  else
    # continue on to next
  end
  #binding.pry
end

if have_seen_a_match
  puts "Your guess was right"
else
  puts "Your guess was wrong"
  tries -= 1
  puts "You have #{tries} tries left"
end

#binding.pry