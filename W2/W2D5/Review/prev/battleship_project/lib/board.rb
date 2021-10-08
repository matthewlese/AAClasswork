class Board
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
    @n = n
  end

  attr_reader :size

  def [](array)
    @grid[array[0]][array[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    count = 0
    @grid.each do |row|
      row.each { |ele| count += 1 if ele == :S }
    end
    count
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      false
    end
  end

  def place_random_ships
    while self.num_ships < (@size * 0.25)
      posish = [rand(0...@n), rand(0...@n)]
      self[posish] = :S 
    end
  end

  def hidden_ships_grid
    new_arr = []
    @grid.each do |row|
      new_row = []
      row.each do |ele|
        if ele == :S
          new_row << :N 
        else
          new_row << ele
        end
      end
      new_arr << new_row
    end
    new_arr
  end

  def self.print_grid(two_d_arr)
    two_d_arr.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print 
    Board.print_grid(self.hidden_ships_grid)
  end

end
