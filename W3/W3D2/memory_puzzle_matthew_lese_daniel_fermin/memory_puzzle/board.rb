require_relative "card.rb"
class Board
  attr_reader :grid, :size, :face_values
  def initialize(size)
    @size = size
    @grid = Array.new(@size) {Array.new(@size)}
    @face_values = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'] 
  end

  #populate will take a sample from @face_values for each card instance
  #== for card to check matching pair (set == operation to only card value)

  def populate
    @face_values.each do |value|
      val_count = 0
      while val_count < 2
        new_position = [rand(0...@size), rand(0...@size)]
        if @grid[new_position[0]][new_position[1]] == nil
          @grid[new_position[0]][new_position[1]] = Card.new(value)
          val_count += 1
        end
      end

    end
  end

  def render
    @grid.each do |row|
      new_row = ""
      row.each do |card_instance|
        new_row += "#{card_instance.display} "
      end
      p new_row[0...-1]
      puts
    end
  end

  def reveal(array)
    @grid[array[0]][array[1]].reveal
  end

  def cheat
    @grid.each do |row|
      new_row = ""
      row.each do |card_instance|
        new_row += "#{card_instance.face_value} "
      end
      p new_row[0...-1]
      puts
    end
  end

  def won?
    @grid.each do |row|
      row.each {|cell| return false if !cell.face_up }
    end
    return true
  end

  def [](position) #remember we want the argument in the format [i, j]
    x, y = position
    @grid[x][y]
  end

  def []=(position, value)
    x, y = position
    @grid[x][y] = value
  end

end