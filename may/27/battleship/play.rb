require 'pry'

require "./ship"
require "./cell"
require "./board"

# Set up ships
# Player 1 first and then player 2
# Carrier, then battleship, then ...
player1_board = Board.new

def ask_player_to_place_ship ship, board
  print "Where should I place the #{ship.name}? "
  coords = gets.chomp
  print "What direction? "
  direction = gets.chomp

  board.place_ship(ship, coords, direction.to_sym)
end

ask_player_to_place_ship Ship.new("Carrier", 5),    player1_board
ask_player_to_place_ship Ship.new("Battleship", 4), player1_board

puts player1_board.with_ships

player2_board = Board.new



# Start taking moves