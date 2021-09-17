# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
    arr = []
    (2..num).each do |factor|
        if is_prime?(factor) && num % factor == 0
            arr << factor
        end
    end
    arr.max
end

def is_prime?(num)
    false if num < 2
    (2...num).none? { |i| num % i ==0 }
end

def unique_chars?(str)
    counts = Hash.new(0)
    str.each_char do |char|
        counts[char] += 1
    end
    if counts.values.max > 1
        false
    else
        true
    end
end

def dupe_indices(arr)
    indices = Hash.new()
    arr.each do |ele|
        if arr.count(ele) > 1
            new_arr = []
            arr.each_with_index do |letter, idx|
                if letter == ele
                    new_arr << idx
                end
            end
            indices[ele] = new_arr
        end
    end
    indices
end

def ele_count(arr)
    counts = Hash.new(0)
    arr.each do |ele|
        counts[ele] += 1
    end
    counts
end

def ana_array(arr_1, arr_2)
    ele_count(arr_1).sort_by { |k, v| k } == ele_count(arr_2).sort_by { |k, v| k }
end

