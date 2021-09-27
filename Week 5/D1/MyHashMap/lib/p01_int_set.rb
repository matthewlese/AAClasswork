class MaxIntSet

  attr_reader :store, :max
  
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    store[num] = true
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
    num >= 0 && num < max
  end

  def validate!(num)
  end
end


class IntSet

  attr_reader :num_buckets, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num % num_buckets
    store[idx]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self.include?(num)
      resize! unless count < num_buckets
      self[num].push(num) 
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num % num_buckets
    store[idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.flatten
    @store = Array.new(num_buckets * 2)  { Array.new }
    @count = 0
    temp.each { |val| self.insert(val) }
  end

end
