def range(start, rg_end)
  return [start] if start == rg_end
  [start] + range(start + 1, rg_end)
end

def array_sum_iter(arr)
  sum = 0
  arr.each do |ele|
    sum += ele
  end
  return sum
end

def array_sum_rec(arr)
  return arr[0] if arr.length <= 1
  arr[0] + array_sum_rec(arr[1..-1])
end

# p array_sum_rec([1,3,4,5,6,7])

def exp_1(base, n)
  return 1 if n == 0
  base * exp_1(base, n - 1)
end


def exp_2(base, n)
  return 1 if n == 0
  return base if n == 1
  if n.even? 
    exp_2(base, n / 2) ** 2 
  else
    base * (exp_2(base, (n - 1) / 2) ** 2)
  end
end

# p exp_1(4, 3) == exp_2(4,3)

def deep_dup(array)
  return array if array.class != Array.class #if !array.is_a? Array
  new_arr = []
  array.each do |ele|
    new_arr << deep_dup(ele)
  end
  new_arr
end

# test_arr = [1, [2], [3, [4]]]
# p deep_dup(test_arr)[-1][-1] << 5

def rec_fib(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  temp = rec_fib(n - 1)
  temp + [temp[-1] + temp[-2]]
end

# p rec_fib(3)
# p rec_fib(4)
# p rec_fib(1)

def iter_fib(n)
  arr = [0,1]
  (2..n).each do |i|
    arr[i] = arr[i-1] + arr[i-2]
  end 
  arr[0...n]
end

# p iter_fib(3)
# p iter_fib(4)
# p iter_fib(1)

def bsearch(arr,target)
  return nil if arr.length == 0
  middle_index = arr.length/2 
  return middle_index if arr[middle_index] == target 
  if arr[middle_index] > target #looks left
    temp_left = bsearch(arr[0...middle_index], target)
    temp_left if temp_left != nil
  else #looks right
    temp_right = bsearch(arr[middle_index + 1 .. -1], target)
    arr[0..middle_index].length + temp_right if temp_right != nil
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(left, right)
  return left if right.length < 1
  return right if left.length < 1

  if left[0] <= right[0]
    smallest = left.shift
  else
    smallest = right.shift
  end
  
  arr_without_smallest = merge(left, right)
  [smallest].concat(arr_without_smallest)
end

def merge_sort(arr)
  return arr if arr.length <= 1
  left = arr[0...arr.length/2]
  right = arr[arr.length/2..-1]
  merge(merge_sort(left), merge_sort(right))
end


# p merge_sort([4,2,1,5]) # ==> [1, 2, 4, 5]
# p merge_sort([9,55,990,301,23,1,3,4,57,4,566,4,23])

def subsets(arr)
  return [] if arr.empty?
  subset = arr.combination(arr.length).to_a
  if arr.length >= 2
    arr.pop
    subset << subsets(arr)
  else
    return arr
  end
end

p subsets([1, 2, 3, 4])