class Board
  def initialize
    @grid = Array.new(3) {Array.new(3, "_")}
  end

  def valid?(posish)
    posish.all? {|ele| ele >= 0 } && posish[0] < 3 && posish[1] < 3
  end

  def empty?(posish)
    @grid[posish[0]][posish[1]] == "_"
  end

  def place_mark(posish, mark)
    if !self.valid?(posish)
      raise "invalid posish"
    elsif !self.empty?(posish)
      raise "posish is not empty"
    end
    @grid[posish[0]][posish[1]] = mark
  end

  def print
    @grid.each do |row|
      puts row.join(" ")
    end
  end

  def win_row?(mark)
    @grid.any? do |row|
      row.all? { |ele| ele == mark }
    end
  end

  def win_col?(mark)
    @grid.transpose.any? do |col|
      col.all? { |ele| ele == mark }
    end
  end

  def win_diagonal?(mark)
    [@grid[0][0], @grid[1][1], @grid[2][2]].all? { |ele| ele == mark } || [@grid[0][2], @grid[1][1], @grid[2][0]].all? { |ele| ele == mark }
  end

  def win?(mark)
    self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
  end

  def empty_positions?
    empty_count = 0
    @grid.each do |row|
      row.each { |ele| empty_count += 1 if ele == "_" }
    end
    empty_count >= 1
  end

end