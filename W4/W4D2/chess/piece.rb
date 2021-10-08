require "singleton"
require_relative "board"

class Piece

  attr_reader :position, :board, :color

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def symbol(string)
    if @color == "black"
      string.colorize(:blue)
    else
      string
    end
    string
  end

  def empty?
    @board[position].is_a?(NullPiece)
  end

  def valid_moves
    self.move
  end

  def pos=(val)

  end

  def inspect
    symbol
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
