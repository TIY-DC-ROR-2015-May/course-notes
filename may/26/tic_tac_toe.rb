class TicTacToe
  attr_reader :board

  def initialize player1, player2
    @x = player1
    @o = player2

    @current_player = @x

    @board = Array.new 9
  end

  def winner
  end

  def board_full?
    !@board.include?(nil)
  end

  def record_move square
    @board[square - 1] = symbol_for_current_player
    
    # toggle_current_player
    if @current_player == @x # it's x's turn
      @current_player = @o # now it's o's turn
    else
      @current_player = @x # not it's x's turn
    end
  end

  def symbol_for_current_player
    if @current_player == @x
      return :x
    else
      return :o
    end
  end

  def over?
    !winner.nil? || board_full?
  end

  def current_player
    @current_player
  end
end