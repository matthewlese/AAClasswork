def element_count(arr)
    counts = Hash.new(0)
    arr.each do |ele|
        counts[ele] += 1
    end
    counts
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, idx|
        if hash.has_key?(char)
            str[idx] = hash[char]
        end
    end
    str
end

def product_inject(arr)
    arr.inject { |acc, el| acc * el }
end