def remove_dups(array)
  counter = Hash.new(0)
  array.each { |ele| counter[ele] += 1 }
  counter.keys

  # new_arr = []
  # array.each {|ele| new_arr << ele if !new_arr.include?(ele) }
  # new_arr
end

def two_sum(array)
  new_arr = []
  (0...array.length).each do |i1|
    (i1 + 1...array.length).each do |i2|
      new_arr << [i1,i2] if array[i1] + array[i2] == 0
    end
  end
  new_arr
end

def my_transpose(matrix)
  new_arr = []

  i = 0
  while i < matrix.size
    new_row = []
    matrix.each {|row| new_row << row[i]}
    new_arr << new_row
    i += 1
  end

  new_arr
end