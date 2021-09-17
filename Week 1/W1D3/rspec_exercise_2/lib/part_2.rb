def palindrome?(str)
    half_way = str.length / 2.0
    i = 0
    j = -1
    while i < half_way
        if str[i] != str[j]
            return false
        end
        i += 1
        j -= 1
    end
    true
end

def substrings(str)
    arr = []
    (0...str.length).each do |i|
        (i...str.length).each do |i2|
            arr << str[i..i2]  #slices string from first index to second, which can be the same
        end
    end
    arr
end

def palindrome_substrings(str)
    new_arr = substrings(str)
    new_arr.select { |ele| palindrome?(ele) && ele.length > 1}
end