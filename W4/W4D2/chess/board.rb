require_relative "piece"
# require_relative "slideable.rb"


class Board

  attr_reader :rows

  def initialize
    @sentinal = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, @sentinal)}
    @black_pieces = Hash.new
    @white_pieces = Hash.new
  end

  def [](position)
    row, col = position
    @rows[row][col]
  end

  def []=(position, value)
    row, col = position
    @rows[row][col] = value
  end

  def valid_position?(position, color)
    row, col = position
    return false if (row > 7 || row < 0) || (col > 7 || col < 0)
    empty_pos?(position) || self[position].color != color
  end

  def empty_pos?(position)
    self[position].is_a?(NullPiece)
  end

  def add_piece(piece, position)
    self[position] = piece
    if piece.color == "black"
      @black_pieces[piece] = position
    else
      @white_pieces[piece] = position
    end
  end

  def remove_piece(piece, color)
    if color == black
      @black_pieces.delete(piece)
    else
      @white_pieces.delete(piece)
    end
  end

  def move_piece!(start_pos, end_pos, color)
    raise "Start position is empty" if empty_pos?(start_pos)
    raise "End position is invalid" if !valid_position?(end_pos, color)
    curr_piece = self[start_pos]
    dest_piece = self[end_pos]
    if !dest_piece.empty?
      remove_piece(dest_piece, dest_piece.color)
    end
    add_piece(curr_piece, end_pos)
    self[start_pos] = @sentinal
  end

  def populate_board
    arr = []
    # top = white
    self.rows[1].each_index do |col|
      self.add_piece(Pawn.new("white", self, [1, col]), [1, col])
    end
    self.add_piece(Rook.new("white", self, [0, 0]), [0, 0])
    self.add_piece(Rook.new("white", self, [0, 7]), [0, 7])

    self.add_piece(Knight.new("white", self, [0, 1]), [0, 1])
    self.add_piece(Knight.new("white", self, [0, 6]), [0, 6])
    
    self.add_piece(Bishop.new("white", self, [0, 2]), [0, 2])
    self.add_piece(Bishop.new("white", self, [0, 5]), [0, 5])
    
    self.add_piece(Queen.new("white", self, [0, 4]), [0, 4])
    self.add_piece(King.new("white", self, [0, 3]), [0, 3])

    # bottom = black
    self.rows[6].each_index do |col|
      self.add_piece(Pawn.new("black", self, [6, col]), [6, col])
    end
    self.add_piece(Rook.new("black", self, [7, 0]), [7, 0])
    self.add_piece(Rook.new("black", self, [7, 7]), [7, 7])

    self.add_piece(Knight.new("black", self, [7, 1]), [7, 1])
    self.add_piece(Knight.new("black", self, [7, 6]), [7, 6])
    
    self.add_piece(Bishop.new("black", self, [7, 2]), [7, 2])
    self.add_piece(Bishop.new("black", self, [7, 5]), [7, 5])
    
    self.add_piece(Queen.new("black", self, [7, 4]), [7, 4])
    self.add_piece(King.new("black", self, [7, 3]), [7, 3])
  end

  def in_check?(color)
    king_pos = nil
    if color == "black"
      @black_pieces.each_key |key|
        if key.is_a?(King)
          king_pos = @black_pieces[key]

          @white_pieces.each do |k, v|
            return true if k.valid_moves.include?(king_pos)
          end

        end
      end
    else
      @white_pieces.each_key |key|
        if key.is_a?(King)
          king_pos = @white_pieces[key]

          @black_pieces.each do |k, v|
            return true if k.valid_moves.include?(king_pos)
          end

        end
      end
    end
    false
  end

end
