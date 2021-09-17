# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  #part 1
  def span
    return nil if self.length == 0
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum * 1.0 / self.length
  end

  def median
    return nil if self.empty?
    sorted = self.sort
    if self.length.odd?
      return sorted[self.length / 2]
    else
      sorted[(self.length / 2) - 1..(self.length / 2)].sum / 2.0
    end
  end

  def counts
    counter = Hash.new(0)
    self.each { |ele| counter[ele] += 1 }
    counter
  end

  #part 2

  def my_count(val)
    count = 0
    self.each { |ele| count += 1 if ele == val }
    count
  end

  def my_index(val)
    self.each.with_index { |ele, i| return i if ele == val }
    nil
  end

  def my_uniq
    new_arr = []
    self.each { |ele| new_arr << ele if !new_arr.include?(ele) }
    new_arr
  end

  def my_transpose
    new_arr = []
    i = 0
    while i < self.length
      new_sub = []
      self.each { |subarr| new_sub << subarr[i] }
      new_arr << new_sub
      i += 1
    end
    new_arr
  end

end
