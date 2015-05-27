require 'minitest/autorun'
require 'pry'

ENV["SILENT_RUNNING"] = "true"

require "./ship"
require "./cell"
require "./board"


class ShipTest < MiniTest::Test
  def test_it_can_be_hit
    catnapper = Ship.new "Catalina 22", 4
    assert_equal 4, catnapper.health
    catnapper.hit!
    assert_equal 3, catnapper.health
  end

  def test_it_can_be_sunk
    s = Ship.new "Trireme", 3
    refute s.sunk?
    3.times { s.hit! }
    assert s.sunk?
  end
end


class CellTest < MiniTest::Test
  def test_it_may_be_occupied
    c = Cell.new
    refute c.occupied?

    c.ship = Ship.new "Carrier", 5
    assert c.occupied?
  end

  def test_it_can_be_hit
    c = Cell.new
    c.ship = Ship.new "Battleship", 4
    c.has_been_fired_on!

    assert c.fired_on?
    assert c.hit?
    refute c.missed?

    assert_equal 3, c.ship.health
  end

  def test_it_can_be_missed
    c = Cell.new
    c.has_been_fired_on!

    assert c.fired_on?
    assert c.missed?
    refute c.hit?
  end
end


class BoardTest < MiniTest::Test
  def board_with_ships_placed
    board = Board.new
    board.place_ship Ship.new("Carrier", 5), "A1", :down
    board.place_ship Ship.new("Battleship", 4), "B2", :right
    return board
  end

  def test_cant_override_ships
    b = board_with_ships_placed
    assert_raises Board::IllegalMove do
      b.place_ship Ship.new("Submarine", 3), "A3", :right
    end
  end

  def test_reports_a_hit
    b = board_with_ships_placed

    hit = b.fire_on! "A1"
    assert hit

    hit = b.fire_on! "D5"
    refute hit
  end

  def test_all_ships_can_be_sunk
    b = board_with_ships_placed
    assert_equal 2, b.ships.count
    refute b.ships.all? { |ship| ship.sunk? }

    %w(A1 B1 C1 D1 E1 B2 B3 B4 B5).each do |coords|
      b.fire_on! coords
    end
    assert b.ships.all? { |ship| ship.sunk? }
  end

  def test_can_display_a_move
    b = board_with_ships_placed
    b.fire_on! "A1"
    b.fire_on! "A2"

    assert_includes b.with_ships,    "A|X|O| | | "
    assert_includes b.without_ships, "A|X|O| | | "

    assert_includes b.with_ships,    "B|C|B|B|B|B| |"
    assert_includes b.without_ships, "B| | | | | | |"
  end

  def test_rejects_bad_moves
    b = Board.new
    assert_raises Board::IllegalMove do
      b.fire_on! "Z4"
    end

    b.fire_on! "C3"
    assert_raises Board::IllegalMove do
      b.fire_on! "C3"
    end
  end
end
