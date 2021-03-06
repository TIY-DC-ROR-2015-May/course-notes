require 'pry'

# -- Set up game --

list = ["banana", "table", "awesome"]
word = list.sample
letters_in_word = word.split("") # word.chars
tries = 5

# ["_"] * word.length

board = [] # Array of underscores
letters_in_word.each do |letter|
  board.push "_"
end


game_is_over = false
until game_is_over
  puts "The board is: #{board}"
  
  # -- Start taking player input --

  print "Pick a letter > "
  guess = gets.chomp

  # -- Check guess --

  have_seen_a_match = false

  index = 0
  letters_in_word.each do |letter|
    if letter == guess
      have_seen_a_match = true
      board[index] = letter
    else
      # continue on to next
    end
    index += 1
    #binding.pry
  end

  if have_seen_a_match
    puts "Your guess was right"
  else
    puts "Your guess was wrong"
    tries -= 1
  end

  puts "You have #{tries} tries left"

  if tries == 0 || board.join("") == word
    game_is_over = true
  end
end