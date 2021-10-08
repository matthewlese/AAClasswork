class Board
  require "byebug"

  def initialize(size)
    @size = size
    @grid = Array.new(@size){Array.new(@size)}
  end
  
  attr_reader :size

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, mark)
    @grid[pos[0]][pos[1]] = mark
  end

  def complete_row?(mark)
    @grid.each do |row|
      return true if row.all? { |ele| ele == mark }
    end
    false
  end

  def complete_col?(mark)
    (0...@size).each do |i|
      return true if @grid.all? { |row| row[i] == mark }
    end
    false
  end

  def complete_diag?(mark) #for any size
    diag_1 = []
    (0...@size).each do |i1| #iterate through indices in rows
      diag_1 << @grid[i1][i1]
    end
    return true if diag_1.all? {|ele1| ele1 == mark}
    diag_2 = []
    (0...@size).each do |i2| #iterate through indices in rows
      diag_2 << @grid[i2][@size - i2 - 1]
    end
    return true if diag_2.all? {|ele2| ele2 == mark}
    false
  end

  def winner?(mark)
    return true if self.complete_row?(mark) || self.complete_col?(mark) || self.complete_diag?(mark)
    false
  end

  # This Board#print method is given for free and does not need to be modified
  # It is used to make your game playable.
  def print
      @grid.each { |row| p row }
  end
end
