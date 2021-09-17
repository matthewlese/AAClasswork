class Board

  def initialize(n)
    @grid = Array.new(n){Array.new(n, :N)}
    @size = n * n
    @n = n
  end

  attr_reader :size

  def [](position) #arg will be [row, col]
    @grid[position[0]][position[1]]
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
    if self[position] == :S #looks at Board instance's grid for a ship
      self[position] = :H #sets as a hit
      puts "you sunk my battleship!"
      true
    else #i.e. no ship at position
      self[position] = :X
      false
    end
  end

  def place_random_ships
    num_rand_ships = @size * 0.25
    while self.num_ships < num_rand_ships 
      self[[rand(0...@n), rand(0...@n)]] = :S
    end
  end

  def hidden_ships_grid
    new_arr = []
    @grid.each do |row|
      new_arr << row.map do |ele| 
        if ele == :S
          :N 
        else
          ele
        end
      end
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
