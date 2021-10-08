require_relative "piece"
require_relative "board"
require "colorize"

class Pawn < Piece

  attr_reader :position, :color

  def initialize(color, board, position)
    super
  end

  def symbol
    super("P")
  end

  def move
    row, col = self.position
    moves = []

    if self.color == "black" #decrement rows
      next_spot_valid = self.board.valid_position?([row - 1, col], self.color)
      moves << [row - 1, col] if next_spot_valid
      return moves if !next_spot_valid
      moves << [row - 2, col] if self.at_start_row? && self.board.valid_position?([row - 2, col], self.color)
    else #white, increment rows
      next_spot_valid = self.board.valid_position?([row + 1, col], self.color)
      moves << [row + 1, col] if next_spot_valid
      return moves if !next_spot_valid
      moves << [row + 2, col] if self.at_start_row? && self.board.valid_position?([row + 2, col], self.color)
    end
    
    moves
  end

  def at_start_row?
    if @color == "black"
      self.position[0] == 6
    else #white
      self.position[0] == 1
    end
  end

  
end