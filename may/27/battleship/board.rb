class Board
  class IllegalMove < StandardError
  end


  attr_reader :ships

  def initialize
    @squares = {}
    ('A'..'I').each do |row|
      (1..9).each do |col|
        @squares["#{row}#{col}"] = Cell.new
      end
    end

    @ships = []
  end

  def place_ship ship, square, direction
    @ships.push ship

    row = square[0]
    col = square[1].to_i

    if direction == :right
      squares = (0 ... ship.length).map { |i| "#{row}#{col + i}" }
    else
      squares = (0 ... ship.length).map { |i| "#{letters_after row, i}#{col}" }
    end

    squares.each { |coords| cell_at(coords).ship = ship }
  end

  def fire_on! coords
    c = cell_at(coords)
    if c.fired_on?
      raise IllegalMove, "#{coords} has already been fired on"
    else
      c.has_been_fired_on!
    end

    return c.hit?
  end

  def with_ships
    display true
  end
  def without_ships
    display false
  end

  def occupied? coords
    cell_at(coords).occupied?
  end

private

  def cell_at coords
    unless cell = @squares[coords]
      raise IllegalMove, "#{coords} is out of bounds"
    end
    cell
  end

  def display show_ships
    result  = "  1|2|3|4|5|6|7|8|9\n"
    result += "-------------------\n"

    ('A'..'I').each do |letter|

      row = [letter]
      (1..9).each do |col|
        cell = cell_at("#{letter}#{col}")
        row.push symbol_for_cell(cell, show_ships)
      end

      result += row.join("|")
      result += "\n"
    end

    result
  end

  def symbol_for_cell cell, show_ships
    if cell.hit?
      "X"
    elsif cell.missed?
      "O"
    elsif cell.ship && show_ships
      cell.ship.name.chars.first
    else
      " "
    end
  end

  def letters_after start_letter, shift
    (start_letter.ord + shift).chr
  end
end
