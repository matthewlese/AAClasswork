class Board
  require "byebug"

  def self.build_stacks(num_stacks)
    Array.new(num_stacks){Array.new}
  end

  def initialize(num_stacks, max_height)
    raise "rows and cols must be >= 4" if num_stacks < 4 || max_height < 4
    @max_height = max_height
    @stacks = Board.build_stacks(num_stacks)
  end

  attr_reader :max_height

  def add(token, stack_index)
    # debugger
    if @stacks[stack_index].size < @max_height #not yet at max height
      @stacks[stack_index] << token
      true
    else #already at max height in given stack
      false
    end
  end

  def vertical_winner?(token)
    return true if @stacks.any? { |stack| stack.size == @max_height && stack.all? { |ele| ele == token } }
    false
  end

  def horizontal_winner?(token)
    (0..@stacks.map(&:size).min).each { |idx| return true if @stacks.all? { |stack| stack[idx] == token } }
    false
  end

  def winner?(token)
    return true if self.vertical_winner?(token) || self.horizontal_winner?(token)
    false
  end

  # This Board#print method is given for free and does not need to be modified
  # It is used to make your game playable.
  def print
      @stacks.each { |stack| p stack }
  end
end
