require "byebug"
class Board
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  attr_reader :size

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    count = 0
    @grid.each { |row| count += row.count(:S) }
    count
  end

  #part 2

  def attack(posish)
    if self[posish] == :S
      self[posish] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[posish] = :X
      return false
    end
  end

  def place_random_ships
    num_new_ships = (0.25 * @size).to_i
    while self.num_ships < num_new_ships
      rand_posish = [rand(0...@grid.length), rand(0...@grid.length)]
      self[rand_posish] = :S
    end
  end

  def hidden_ships_grid
    new_arr = @grid.map do |row|
      row.map do |ele| 
        if ele == :S
          :N
        else
          ele
        end
      end
    end
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
