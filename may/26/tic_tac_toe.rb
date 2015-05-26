class TicTacToe
  attr_reader :board

  def initialize player1, player2
    @x = player1
    @o = player2

    @current_player = @x

    @board = Array.new 9
  end

  def winner
    lines = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    lines.each do |line|
      # entries = []
      # line.each do |position|
      #   entries.push @board[position]
      # end
      entries = line.map { |pos| @board[pos] }
      if entries == [:x,:x,:x]
        return @x
      elsif entries == [:o,:o,:o]
        return @o
      end
    end

    return nil
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