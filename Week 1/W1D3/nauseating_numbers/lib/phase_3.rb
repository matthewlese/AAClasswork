require "byebug"

# def matrix_addition_reloaded(*arrays)
#     debugger
#     heights = []
#     widths = []
#     arrays.each do |array|
#         heights << array.length
#         widths << array[0].length
#     end
#     heights.each_with_index do |h1, i1|
#         heights.each_with_index do |h2, i2|
#             if i1 < i2 && h1 != h2
#                 return nil
#             end
#         end
#     end
#     widths.each_with_index do |w1, i1|
#         widths.each_with_index do |w2, i2|
#             if i1 < i2 && w1 != w2
#                 return nil
#             end
#         end
#     end
#     height = arrays[0].length
#     width = arrays[0][0].length
#     result = Array.new(height) { [0] * width }
#     (0...height).each do |row|
#         (0...width).each do |col|
#             result[row][col] = arrays[0][row][col] + arrays[1][row][col]
#         end
#     end
#     result
# end

def matrix_addition_reloaded(arr_1, *arrays) #accepting any number of arguments, treat dirst one as comparison point for nil condition
    #return nil when they're not the same size
    arrays.each do |array|
        #compare the length of arr_1 against the others
        if arr_1.length != array.length
            return nil
        end
    end

    final_arr = []
    arr_1.each_with_index do |sub_arr, i|
        sub_arr_final = []
        arr_1[i].each_with_index do |num, j|
            sum_nums = 0
            arrays.each { |arr| sum_nums += arr[i][j] }
            sub_arr_final << sum_nums + num
        end
        final_arr << sub_arr_final
    end
    final_arr
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# def squarocol?(arr)
#     arr.each do |rows|
#         if rows.uniq.size <= 1
#             return true
#         end
#     end
#     (0...arr[0].length).each do |cols|
#         if 
#             colro = []
#             colro << arr[cols][0]
#         end
#     end
# end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false