class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 1375098234589.hash if empty?
    inject(2) do |acc, ele|
      (acc + ele.hash).hash
    end
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    var = to_a.inject(3) do |acc, ele|
      (acc + ele.hash)
    end
    var.hash
  end
end
