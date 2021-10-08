def partition(arr, num)
    new_arr = []
    lessers = []
    greaters = []
    arr.each do |ele|
        if ele < num
            lessers << ele
        else
            greaters << ele
        end
    end
    new_arr << lessers
    new_arr << greaters
    new_arr
end

def merge(hash_1, hash_2)
    new_hash = Hash.new()
    hash_1.each do |k1, v1|
        new_hash[k1] = v1
    end
    hash_2.each do |k2, v2|
        new_hash[k2] = v2
    end
    new_hash
end

def censor(sent, arr)
    new_sent = []
    sent_arr = sent.split(" ")
    sent_arr.each do |word|
        if !arr.include?(word.downcase)
            new_sent << word
        else
            new_word = ""
            word.each_char do |char|
                if !"aeiou".include?(char.downcase)
                    new_word += char
                else
                    new_word += "*"
                end
            end
            new_sent << new_word
        end
    end
    new_sent.join(" ")
end

def power_of_two?(num)
    i = 1
    while i <= num
        if i == num
            return true
        end
        i *= 2
    end
    false
end