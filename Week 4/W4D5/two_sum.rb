def bad_two_sum?(arr, target_sum)
  pairs = arr.permutation(2).to_a
  pairs.each { |pair| return true if pair.sum == target_sum }
  false
end

def ok_two_sum?(arr, target_sum)
  sorted = arr.sort.select { |el| el < target_sum }
  sorted.each do |el|
    diff = target_sum - el
    b = sorted.bsearch { |x| x == diff }
    return true if b != nil
  end
  false
end

# def two_sum?(arr, target_sum)
#   hash = Hash.new(0)
#   arr.each do |el|
#     return true if hash[target_sum - el] > 0
#     hash[el] += 1
#   end
#   false
# end

arr = [0, 1, 5, 7, 3, 4, 12]
p ok_two_sum?(arr, 17) # => should be true
p ok_two_sum?(arr, 10) # => should be true
p ok_two_sum?(arr, 24) # => should be false, watch for doubles
