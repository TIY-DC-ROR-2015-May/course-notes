class Hangman
  attr_reader :word, :guesses_left, :guessed

  def initialize word=nil, guesses_left=nil, guessed=nil
    # @word = word || available_words.sample
    if word
      @word = word
    else
      @word = available_words.sample
    end
    @guesses_left = if guesses_left
      guesses_left.to_i
    else
      8
    end
    @guessed = if guessed
      guessed.split(",")
    else
      []
    end
  end

  def available_words
    words = []
    File.open("/usr/share/dict/words").each_line do |line|
      line.chomp!
      if line.length > 2 && line.length < 8 && line == line.downcase
        words.push line
      end
    end
    words
  end

  def over?
    won? || lost?
  end

  def won?
    word.chars.all? { |l| @guessed.include?(l) }
  end

  def lost?
    guesses_left <= 0
  end

  def board
    squares = []
    word.chars.each do |l|
      if @guessed.include? l
        squares.push l
      else
        squares.push "_"
      end
    end
    squares.join ""
  end

  def misses
    @guessed - word.chars
  end

  def record_guess letter
    @guessed.push letter
    unless word.chars.include? letter
      @guesses_left -= 1
    end
  end
end
