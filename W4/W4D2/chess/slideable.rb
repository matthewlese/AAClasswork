require_relative "piece"
require_relative "board"

module Slideable

  def horizontal_moves
    moves = []
    row, col = self.position

    col_idx = col - 1
    while col_idx >= 0
      valid_pos = self.board.valid_position?([row, col_idx], self.color)
      moves << [row, col_idx] if valid_pos
      break if !valid_pos
      col_idx -= 1
    end

    (col + 1..7).each do |col_idx|
      valid_pos = self.board.valid_position?([row, col_idx], self.color)
      moves << [row, col_idx] if valid_pos
      break if !valid_pos
    end

    moves
  end

  def vertical_moves
    moves = []
    row, col = self.position
    
    row_idx = row - 1
    while row_idx >= 0
      valid_pos = self.board.valid_position?([row_idx, col], self.color)
      moves << [row_idx, col] if valid_pos
      break if !valid_pos
      row_idx -= 1
    end

    (row + 1..7).each do |row_idx|
      valid_pos = self.board.valid_position?([row_idx, col], self.color)
      moves << [row_idx, col] if valid_pos
      break if !valid_pos
    end

    moves
  end

  def pos_diagonal_moves #top-left to bottom-right
    moves = []
    row, col = self.position
    
    row_idx = row - 1
    col_idx = col - 1
    until row_idx < 0 || col_idx < 0
      valid_pos = self.board.valid_position?([row_idx, col_idx], self.color)
      moves << [row_idx, col_idx] if valid_pos
      break if !valid_pos
      row_idx -= 1
      col_idx -= 1
    end
    
    row_idx = row + 1
    col_idx = col + 1
    until row_idx > 7 || col_idx > 7
      valid_pos = self.board.valid_position?([row_idx, col_idx], self.color)
      moves << [row_idx, col_idx] if valid_pos
      break if !valid_pos
      row_idx += 1
      col_idx += 1
    end

    moves
  end

  def neg_diagonal_moves #bottom-left to top-right
    moves = []
    row, col = self.position
    
    row_idx = row + 1
    col_idx = col - 1
    until row_idx > 7 || col_idx < 0
      valid_pos = self.board.valid_position?([row_idx, col_idx], self.color)
      moves << [row_idx, col_idx] if valid_pos
      break if !valid_pos
      row_idx += 1
      col_idx -= 1
    end
    
    row_idx = row - 1
    col_idx = col + 1
    until row_idx < 0 || col_idx > 7
      valid_pos = self.board.valid_position?([row_idx, col_idx], self.color)
      moves << [row_idx, col_idx] if valid_pos
      break if !valid_pos
      row_idx -= 1
      col_idx += 1
    end
    
    moves
  end

  def move
    moves = []
    if self.is_a?(Bishop)
      moves += self.pos_diagonal_moves + self.neg_diagonal_moves
    elsif self.is_a?(Rook)
      moves += self.vertical_moves + self.horizontal_moves
    else #Queen
      moves += self.pos_diagonal_moves + self.neg_diagonal_moves
      moves += self.vertical_moves + self.horizontal_moves
    end
    moves
  end

end

class Bishop < Piece

  include Slideable

  attr_reader :position

  def initialize(color, board, position)
    super
  end

  def symbol
    super("B")
  end

end

class Rook < Piece

  include Slideable

  attr_reader :position, :board

  def initialize(color, board, position)
    super
  end

  def symbol
    super("R")
  end

end

class Queen < Piece

  include Slideable

  attr_reader :position

  def initialize(color, board, position)
    super
  end

  def symbol
    super("Q")
  end

end