require_relative "piece"
require_relative "board"

module Stepable

  def king_moves
    moves = []
    row, col = self.position
    (-1..1).each do |i|
      (-1..1).each do |j|
        new_pos = [row + i, col + j]
        valid_pos = self.board.valid_position?(new_pos, self.color)
        moves << new_pos if valid_pos
      end
    end

    moves
  end

  def knight_moves

    permutations = [
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2],
      [2, 1],
      [2, - 1],
      [-2, -1],
      [-2, 1]
    ]

    row, col = self.position

    moves = []
    permutations.each do |move| 
      new_pos = [move[0] + row, move[1] + col]
      # next if new_pos.any? { |ele| ele < 0 || ele > 7 }
      valid_pos = self.board.valid_position?(new_pos, self.color)
      moves << new_pos if valid_pos
    end
    moves
  end

  def move
    moves = []
    if self.is_a?(King)
      moves += self.king_moves
    else # Knight
      moves += self.knight_moves
    end
    moves
  end

end

class Knight < Piece

  include Stepable

  attr_reader :position, :board

  def initialize(color, board, position)
    super
  end

  def symbol
    super("N")
  end

end

class King < Piece

  include Stepable

  attr_reader :position, :board

  def initialize(color, board, position)
    super
  end

  def symbol
    super("K")
  end
  
end
