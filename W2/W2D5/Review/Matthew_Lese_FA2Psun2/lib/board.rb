class Board

  def self.build_stacks(num_stacks)
    Array.new(num_stacks){Array.new}
  end

  def initialize(num_stacks, max_height)
    if num_stacks < 4 || max_height < 4
      raise 'rows and cols must be >= 4'
      return
    end
    @max_height = max_height
    @stacks = Board.build_stacks(num_stacks)
  end

  attr_reader :max_height

  def add(token, i)
    if @stacks[i].size < @max_height
      @stacks[i] << token
      true
    else
      false
    end
  end

  def vertical_winner?(token)
    @stacks.each { |stack| return true if stack.size == @max_height && stack.all? { |ele| ele == token } }
    false
  end

  def horizontal_winner?(token)
    (0..@stacks.map(&:size).min).each do |i|
      return true if @stacks.all? { |stack| stack[i] == token }
    end
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
