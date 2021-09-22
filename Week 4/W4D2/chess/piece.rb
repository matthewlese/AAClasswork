require "singleton"
require_relative "board"

class Piece

  attr_reader :position

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def empty?
    @board[position].is_a?(NullPiece)
  end

  def to_s

  end

  def valid_moves

  end

end

class NullPiece < Piece
  include Singleton
  
  def initialize

  end

  def moves
    
  end

  def symbol
    "_"
  end

  def empty?
    true
  end

  def inspect
    symbol
  end

end


module Slideable

  def horizontal_moves(board, position)
    moves = []
    row, col = position
    (0...col).each do |col_idx|
      moves << [row, col_idx] if board.valid_position?([row, col_idx])
      break if !board.valid_position?([row, col_idx])
    end
    (col..7).each do |col_idx|
      moves << [row, col_idx] if board.valid_position?([row, col_idx])
      break if !board.valid_position?([row, col_idx])
    end

    moves
  end

  # def move_dirs
    # moves = []
    # if self.is_a?(Bishop)

    # elsif self.is_a?(Rook)

    # else #Queen

    # end
    # moves
  # end

end

class Bishop < Piece

  include Slideable

  attr_reader :position

  def initialize(color, board, position)
    super
  end

  def symbol
    "B"
  end

end

class Rook < Piece

  include Slideable

  attr_reader :position

  def initialize(color, board, position)
    super
  end

  def symbol
    "R"
  end

end

class Queen < Piece

  include Slideable

  attr_reader :position

  def initialize(color, board, position)
    super
  end

  def symbol
    "Q"
  end

end