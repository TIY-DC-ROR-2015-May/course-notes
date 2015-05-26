class TicTacToe
  def initialize player1, player2
    @x = player1
    @o = player2

    @current_player = @x

    @board = Array.new 9
  end

  def winner
  end

  def board_full?
    # @board.each do |entry|
    #   if entry.nil?
    #     return false
    #   end
    # end
    # return true

    # @board.any? { |e| e.nil? }
    !@board.include?(nil)
  end

  def record_move square
    @board[square - 1] = :x
  end

  def over?
    !winner.nil? || board_full?
  end

  def current_player
    @current_player
  end
end