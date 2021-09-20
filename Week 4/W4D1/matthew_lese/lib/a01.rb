# Write a method that binary searches an array for a target and returns its
# index if found. Assume a sorted array.

# **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
# or `Array#member` methods in your implementation.**

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every time
# you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.

def binary_search(arr, target)
  return nil if arr.empty?
  halfway = arr.size / 2
  return halfway if arr[halfway] == target
  if arr[halfway] > target
    binary_search(arr[0...halfway], target)
  else
    right = binary_search(arr[halfway + 1..-1], target) #memoize
    return nil if right.nil?
    halfway + right + 1
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = []
    self.each.with_index do |ele, i1|
      (i1 + 1...self.size).each do |i2|
        pairs << [i1, i2] if ele + self[i2] == target
      end
    end
    pairs
  end
end

# Write a recursive method that returns the first "num" factorial numbers in
# ascending order. Note that the 1st factorial number is 0!, which equals 1.  
# The 2nd factorial is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1 #just 0!
  prev = factorials_rec(num - 1) #for num = 2, prev = [1]
  prev += [prev[-1] * (num - 1)] # += 1*(1-1), ret [1, 1]
end

class String
  # Write a `String#shuffled_sentence_detector(other_string)` method that 
  # returns true if the words in the string can be rearranged to form the 
  # sentence passed as an argument. Words are separated by spaces.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other_string)
    self_arr = self.downcase.split(" ")
    arg_arr = other_string.downcase.split(" ")
    return false if self_arr.size != arg_arr.size
    self_arr.all? { |word| arg_arr.include?(word) }
      
  end
end

# Write a method that returns the largest prime factor of a number. You may wish
# to write a `prime?(num)` helper method.

def largest_prime_factor(num)
  prime_facs = []
  (2..num).each { |fac| prime_facs << fac if num % fac == 0 && prime?(fac) }
  prime_facs.max
end

def prime?(num)
  (2...num).each {|fac| return false if num % fac == 0}
  true
end

class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index` or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    i = 0
    while i < self.size
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an `Array#my_map` method that returns an array made up of the
  # elements in the array after being passed through the given block.
  # **Do NOT use the built-in `Array#map` method in your implementation.**

  def my_map(&prc)
    new_arr = []
    self.each { |ele| new_arr << prc.call(ele) }
    new_arr
  end
end

