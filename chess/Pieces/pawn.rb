require_relative 'piece'

class Pawn < Piece
  attr_reader :symbol

  def initialize(color, position, board)
    @symbol = color == :white ? "\u2659" : "\u265F"
    super(color, position, board)
  end

  def move_dirs
  end
  
end