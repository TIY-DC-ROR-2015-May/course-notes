require 'pry'

require "./ship"
require "./cell"
require "./board"

# Set up ships
player1_board = Board.new
player2_board = Board.new


def ask_player_to_place_ship ship, board
  print "Where should I place the #{ship.name}? "
  coords = gets.chomp
  print "What direction? "
  direction = gets.chomp

  board.place_ship(ship, coords, direction.to_sym)
end

def ships
  return [
    Ship.new("Carrier", 5),
    Ship.new("Battleship", 4),
    Ship.new("Submarine", 3),
    Ship.new("Destroyer", 3),
    Ship.new("Patrol Boat", 2)
  ]
end

def place_all_ships board
  ships.each do |ship|
    puts board.with_ships
    ask_player_to_place_ship ship, board
  end
end

# place_all_ships player1_board
# place_all_ships player2_board

0.upto 4 do |i|
  ship   = ships[i]
  coords = %w(A1 A2 A3 A4 A5)
  coord  = coords[i]
  player1_board.place_ship ship, coord, :down
end
0.upto 4 do |i|
  ship   = ships[i]
  coords = %w(A1 B1 C1 D1 E1)
  coord  = coords[i]
  player2_board.place_ship ship, coord, :right
end


# Start taking moves
def play_one_turn my_board, opponent_board, number
  system "clear"

  puts "Player #{number} - it's your turn"
  puts "Opponent:"
  puts opponent_board.without_ships
  puts ""
  puts "Yours:"
  puts my_board.with_ships

  print "Your move > "
  coord_to_fire_on = gets.chomp
  hit = opponent_board.fire_on! coord_to_fire_on
  if hit
    puts "It's a hit!"
  else
    puts "You missed!"
  end

  puts "Press enter to continue"
  gets.chomp
  system "clear"

  puts "Press enter when ready"
  gets.chomp
end

player1_wins = false
player2_wins = false

until player1_wins || player2_wins
  play_one_turn player1_board, player2_board, 1
  if player2_board.ships.all? { |s| s.sunk? }
    player1_wins = true
    break
  end

  play_one_turn player2_board, player1_board, 2
  if player1_board.ships.all? { |s| s.sunk? }
    player2_wins = true
  end
end

# Have winner