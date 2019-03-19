require 'colorize'
Dir["/Users/appacademy/Desktop/W2D1/chess/Pieces/*.rb"].each {|file| require file}
require_relative 'display'
require 'byebug'


class Board
  def initialize
    @board = Array.new(8){Array.new(8)}
    setup_board
  end

  def setup_board

    [[0,0], [0,7]].each { |pos| self[pos] = Rook.new(:black, pos, self) }
    [[7,0], [7,7]].each { |pos| self[pos] = Rook.new(:white, pos, self) }
    [[0,1], [0,6]].each { |pos| self[pos] = Knight.new(:black, pos, self) }
    [[7,1], [7,6]].each { |pos| self[pos] = Knight.new(:white, pos, self) }    
    [[0,2], [0,5]].each { |pos| self[pos] = Bishop.new(:black, pos, self) }
    [[7,2], [7,5]].each { |pos| self[pos] = Bishop.new(:white, pos, self) }
    [[0,3]].each { |pos| self[pos] = Queen.new(:black, pos, self) }
    [[7,3]].each { |pos| self[pos] = Queen.new(:white, pos, self) }
    [[0,4]].each { |pos| self[pos] = King.new(:black, pos, self) }
    [[7,4]].each { |pos| self[pos] = King.new(:white, pos, self) }

    (0..7).each do |col|
      self[1,col] = Pawn.new(:black, [1,col], self)
      self[6,col] = Pawn.new(:white, [6,col], self)
    end
    (2..5).each do |row|
      (0..7).each do |col|
        self[[row, col]] = NullPiece.instance
      end
    end
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def valid_move?(pos)
    pos[0] >= 0 && pos[0] < 8 && pos[1] >= 0 && pos[1] < 8
  end

  def empty?(pos)
    return true if self[pos].is_a? NullPiece
  end

  def move_piece(start_pos, end_pos)
    raise InvalidMoveError unless self[start_pos].is_a? Piece
    valid_moves = self[start_pos].valid_moves
    raise InvalidMoveError unless valid_moves.include? end_pos
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end
  attr_accessor :board
end




class InvalidMoveError < StandardError
  def message
    "This is not a valid move"
  end
end

if __FILE__ == $PROGRAM_NAME
  # b = Board.new
  # d = Display.new(b)
  # #d.render

  # d.move
  # # b.render
  # # b.move_piece([1,0], [3,0])
  # # b.render

  board = Board.new
  q = Queen.new(:black, [3,3], board)
  #p b.on_board?([0,8])
  p q.symbol
  #p all_pos = q.moves
end