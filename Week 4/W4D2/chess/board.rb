require_relative "piece.rb"

class Board

  attr_reader :rows

  def initialize
    @rows = Array.new(8) {Array.new(8, NullPiece.instance)}
    # @sentinal = NullPiece.instance
  end

  def [](position)
    row, col = position
    @rows[row][col]
  end

  def []=(position, value)
    row, col = position
    @rows[row][col] = value
  end

  def valid_position?(position) # [0, 0]
    !self[position].is_a?(NullPiece)
  end

  def add_piece(piece, position)
    # row, col = position
    # @rows[row][col] = piece

    self[position] = piece
  end

  def move_piece!(start_pos, end_pos)
    raise "Start position is empty" if !valid_position?(start_pos)
    raise "End position is invalid" if !valid_position?(end_pos)
    curr_piece = self[start_pos]
    add_piece(curr_piece, end_pos)
    # self[start_pos] = @sentinal
  end

end
