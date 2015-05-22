class Hangman
  def initialize
    list = ["banana", "table", "awesome"]
    @word = list.sample
    @letters_in_word = @word.split("") # word.chars
    @tries = 5

    @board = [] # Array of underscores
    @letters_in_word.each do |letter|
      @board.push "_"
    end
  end

  def over?
    @tries == 0 || @board.join("") == @word
  end

  # attr_reader :board
  def show_me_the_board
    @board
  end

  attr_reader :tries

  def record_letter the_letter_that_was_guessed
    have_seen_a_match = false

    index = 0
    @letters_in_word.each do |letter|
      if letter == the_letter_that_was_guessed
        have_seen_a_match = true
        @board[index] = letter
      end
      index += 1
    end

    if have_seen_a_match
      puts "Your guess was right"
    else
      puts "Your guess was wrong"
      @tries -= 1
    end
  end
end


# puts "Which game do you want to play?"
# game_choice = gets.chomp
# if game_choice == 1
  game = Hangman.new
# else
#   game = NumberGuessing.new
# end

until game.over?
  puts "The board is: #{game.show_me_the_board}"

  print "Pick a letter > "
  your_guess = gets.chomp

  game.record_letter your_guess

  puts "You have #{game.tries} tries left"
end