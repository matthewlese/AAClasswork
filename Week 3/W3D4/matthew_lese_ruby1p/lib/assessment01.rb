class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**
  attr_reader :accumulator

  def my_inject(accumulator_arg = nil, &prc)
    accumulator = accumulator_arg
    if accumulator == nil #given no argument, make first element the accumulator
      accumulator = self[0]
      (1...self.length).each do |i|
        accumulator = prc.call(accumulator, self[i])
      end
    else #accumulator starts as argument
      (0...self.length).each do |i|
        accumulator = prc.call(accumulator, self[i])
      end
    end
    accumulator
  end

end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  (2...num).each do |fac|
    return false if num % fac == 0
  end
  true
end

def primes(num)
  primes = []
  i = 2
  while primes.size < num
    primes << i if is_prime?(i)
    i += 1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)  #say we want first 3 i.e. num = 3
  return [] if num == 0 #want nothing
  return [1] if num == 1 #want first factorial number, 0!
  # say num=2 --> we want the first two factorial numbers, [0!, 1!]
  #           --> need to take the num=1 factorial arr and concat the second factorial number
  prev = factorials_rec(num - 1) #returns [0!], or [1]
  prev + [prev[-1] * (num - 1 )] #concat onto [1]: previous factorial number times the next integer, i.e. 1 * 1 = 1
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dupes = Hash.new()
    self.each do |ele|
      if self.count(ele) > 1
        indices = []
        self.each.with_index do |ele2, idx|
          indices << idx if ele2 == ele
        end
        dupes[ele] = indices
      end
    end
    dupes
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.
  def get_substrings
    substrings = []
    self.each_char.with_index do |char, i|
      (i...self.length).each { |end_idx| substrings << self[i..end_idx] }
    end
    substrings.select {|substring| substring.length > 1 }
  end

  def symmetric_substrings
    self.get_substrings.select do |substring|
      substring == substring.reverse
    end
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return self if self.size <= 1 #base case: return array given if it already broken down into single-element or empty array

    midpoint = self.length / 2 #define midpoint for splitting
    left = self[0...midpoint].merge_sort #recursive call on left half
    right = self[midpoint + 1..-1].merge_sort #recursive call on right half

    self.merge(left, right)

  end

  private
  def self.merge(left, right, &prc)
    merged = []

    while !left.empty? && !right.empty? #do while both are not empty, could use until either

      if left[0] <= right[0] #first in left comes first sequentially?
        merged << left.shift #remove first ele from left and put in merged
      else                    #first in right comes first sequentially?
        merged << right.shift #remove first ele from right and put in merged
      end

    end

    merged + left + right #combine merged plus any remaining eles once the first one is empty
  end
end
