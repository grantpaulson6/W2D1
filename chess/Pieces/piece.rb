require 'singleton'
require 'byebug'

class Piece

  attr_reader :color, :board
  attr_accessor :position

  def initialize(color, position, board)
    @position = position
    @color = color
    @board = board
  end

  def moves
    answer = []
    (0..7).each do |row|
      (0..7).each do |col|
        answer << [row, col]
      end
    end
    answer
  end

end

class NullPiece < Piece
  include Singleton
  def initialize
  end
end

