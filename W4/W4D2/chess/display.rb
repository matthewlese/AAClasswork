require_relative "board"
require_relative "cursor"
require "colorize"

class Display

  attr_reader :board, :cursor

  def initialize
    @board = Board.new
    @board.populate_board
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    i = 0
    puts "  0 1 2 3 4 5 6 7"
    @board.rows.each do |row|
      str = ""
      row.each do |elem|
        if elem.color == "black"
          str += elem.inspect.colorize(:blue) + " "
        else
          str += elem.inspect + " " 
        end
      end
      puts "#{i} #{str}"
      i += 1
    end
    nil
  end
  
end
