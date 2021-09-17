class Board

  def self.build_stacks(num)
    Array.new(num) {Array.new}
  end

  def initialize(num_stacks, max_height)
    if num_stacks < 4 || max_height < 4
      raise "rows and cols must be >= 4"
      return
    end
    @max_height = max_height
    @stacks = Board.build_stacks(num_stacks)
  end

  attr_reader :max_height

  def add(token, stack_index)
    if @stacks[stack_index].size < @max_height
      @stacks[stack_index] << token
      true
    else
      false
    end
  end

  def vertical_winner?(token)
    @stacks.each do |stack|
      return true if stack.size == @max_height && stack.all? { |ele| ele == token }
    end
    false
  end

  def horizontal_winner?(token)
    heights = []
    @stacks.each do |stack|
      heights << stack.size
    end
    (0..heights.min).each do |i|
      return true if @stacks.all? { |stack| stack[i] == token }
    end
    false
  end

  def winner?(token)
    self.vertical_winner?(token) || self.horizontal_winner?(token)
  end

  # This Board#print method is given for free and does not need to be modified
  # It is used to make your game playable.
  def print
      @stacks.each { |stack| p stack }
  end
end
