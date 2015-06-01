require './hangman'
require 'pry'

if File.exists? "word.txt"
  file = File.read "word.txt"
  word, guesses_left, guesses = file.split("\n")
  g = Hangman.new word, guesses_left, guesses
else
  g = Hangman.new
end


until g.over?
  puts g.board
  puts "#{g.guesses_left} guesses left | missed #{g.misses.join ','}"

  print "Your guess > "
  guess = gets.chomp
  
  if guess == "quit"
    puts "Saving"
    File.open "word.txt", "w" do |f|
      f.puts g.word
      f.puts g.guesses_left
      f.puts g.guessed.join(",")
    end
    exit
  end

  g.record_guess guess
end

if g.won?
  puts <<WIN
You win!

                                 .''.
       .''.             *''*    :_\/_:     .
      :_\/_:   .    .:.*_\/_*   : /\ :  .'.:.'.
  .''.: /\ : _\(/_  ':'* /\ *  : '..'.  -=:o:=-
 :_\/_:'.:::. /)\*''*  .|.* '.\'/.'_\(/_'.':'.'
 : /\ : :::::  '*_\/_* | |  -= o =- /)\    '  *
  '..'  ':::'   * /\ * |'|  .'/.\'.  '._____
      *        __*..* |  |     :      |.   |' .---"|
       _*   .-'   '-. |  |     .--'|  ||   | _|    |
    .-'|  _.|  |    ||   '-__  |   |  |    ||      |
    |' | |.    |    ||       | |   |  |    ||      |
 ___|  '-'     '    ""       '-'   '-.'    '`      |____
jgs~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
WIN
else
  puts "You lose! The word was #{g.word}"
  puts <<LOSE
| .__________))______|
| | / /      ||
| |/ /       ||
| | /        ||.-''.
| |/         |/  _  \
| |          ||  `/,|
| |          (\\`_.'
| |         .-`--'.
| |        /Y . . Y\
| |       // |   | \\
| |      //  | . |  \\
| |     ')   |   |   (`
| |          ||'||
| |          || ||
| |          || ||
| |          || ||
| |         / | | \
""""""""""|_`-' `-' |"""|
|"|"""""""\ \       '"|"|
| |        \ \        | |
: :         \ \       : :  sk
. .          `'       . .
LOSE
end
