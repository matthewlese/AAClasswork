def anti_prime?(num)
    num_facs = []
    (1..num).each do |ints|
        num_facs << collect_facs(ints).length
    end
    collect_facs(num).length == num_facs.max
end

def collect_facs(num)
    facs = []
    (1..num).each do |fac|
        if num % fac == 0
            facs << fac
        end
    end
    facs
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

# require "enumerator"

# def matrix_addition(arr_1, arr_2)
#     new_flat = []
#     flat_1 = arr_1.flatten
#     flat_2 = arr_2.flatten
#     flat_1.each_with_index do |ele1, idx1|
#         new_flat << flat_1[idx1] + flat_2[idx1]
#     end
#     new_flat.each_slice(new_flat.length / arr_1.length).to_a
# end

def matrix_addition(arr1, arr2)
    height = arr1.length
    width = arr1[0].length
    result = Array.new(height) { [0] * width }
    (0...height).each do |row|
        (0...width).each do |col|
            result[row][col] = arr1[row][col] + arr2[row][col]
        end
    end
    result
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
    arr = []
    (1..nums.max).each do |fac|
        if nums.all? { |num| num % fac == 0 }
            arr << fac
        end
    end
    arr
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
    seq = [1, 1, 2]
    (0..n).each do |i|
        if i >= 3
            seq << seq[(i - 3)..(i - 1)].sum
        end
    end
    seq[n - 1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274