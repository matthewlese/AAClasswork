def select_even_nums(arr)
    arr.select { |num| num.even? } # nums.select(&:even?) is desirable
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |subarr| subarr.sum > 0 }
end

def aba_translate(str)
    new_word = ""
    str.each_char do |char|
        if !"aeiou".include?(char.downcase)
            new_word += char
        else
            new_word += char + "b" + char
        end
    end
    new_word
end

def aba_array(arr)
    arr.map {|word| aba_translate(word) }
end