def remove_dups(array)
  counter = Hash.new(0)
  array.each { |ele| counter[ele] += 1 }
  counter.keys

  # new_arr = []
  # array.each {|ele| new_arr << ele if !new_arr.include?(ele) }
  # new_arr
end

def two_sum(array)
  new_arr = []
  (0...array.length).each do |i1|
    (i1 + 1...array.length).each do |i2|
      new_arr << [i1,i2] if array[i1] + array[i2] == 0
    end
  end
  new_arr
end

def my_transpose(matrix)
  new_arr = []

  i = 0
  while i < matrix.size
    new_row = []
    matrix.each {|row| new_row << row[i]}
    new_arr << new_row
    i += 1
  end

  new_arr
end


def stock_picker(prices)
  hash = Hash.new
  (0...prices.size).each do |day1|
    (day1 + 1...prices.size).each do |day2|
      hash[[day1, day2]] = prices[day2] - prices[day1]
    end
  end

  hash.key(hash.values.max)
end

#############################################################

class Towers
  attr_reader :name, :left, :mid, :right

  def initialize(name)
    @name = name
    @left = [8, 7, 6, 5, 4, 3, 2, 1]
    @mid = []
    @right = []
  end

  def won?
    return true if @right == [8, 7, 6, 5, 4, 3, 2, 1]
  end

  def move(start_stack, end_stack)
    if start_stack == "L"
      moving_piece = @left.pop
    elsif start_stack == "M"
      moving_piece = @mid.pop
    else
      moving_piece = @right.pop
    end

    if end_stack == "L"
      @left.push(moving_piece)
    elsif end_stack == "M"
      @mid.push(moving_piece)
    else
      @right.push(moving_piece)
    end

  end

  def get_input
    puts "Enter a starting stack: L, M, or R"
    start_stack = gets.chomp
    puts "Enter an ending stack: L, M, or R"
    end_stack = gets.chomp
    inputs = [start_stack, end_stack]
  end

  def play
    until won?
      input = get_input
      move(input[0], input[1])
      display
    end
  end

  def display
    puts "#{left}"
    puts "#{mid}"
    puts "#{right}"
  end

end

game = Towers.new("name")
game.play

