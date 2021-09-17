# Write a method, grid(n, m), that accepts two numbers as args.
# The method should return a 2D array with n rows and m columns (this means that there are n subarrays, each of length m).

def grid(n, m)
    # sub = []
    # new_arr = []
    # m.times do
    #     sub << nil
    # end
    # n.times do
    #     new_arr << sub
    # end
    # new_arr
    # Array.new(n, Array.new(m)) does same as above but subarrays aren't independent
    Array.new(n) { Array.new(m) } #each of 'n' times, this block of code is run and a new, distinct array is made
end

result_1 = grid(2, 3)
p result_1              # => [[nil, nil, nil], [nil, nil, nil]]
result_1[0][0] = "X"
p result_1              # => [["X", nil, nil], [nil, nil, nil]]


result_2 = grid(4, 2)
p result_2              # => [[nil, nil], [nil, nil], [nil, nil], [nil, nil]]
result_2[0][0] = "Q"
p result_2              # => [["Q", nil], [nil, nil], [nil, nil], [nil, nil]]
