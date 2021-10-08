def hipsterfy(str)
    vowels = "aeiou"
    if str.count(vowels) == 0
        return str        
    end
    i = str.length - 1
    while i >= 0
        if vowels.include?(str[i])
            return str[0..(i - 1)] + str[(i + 1)..-1]
        end
        i -= 1
    end
end

def vowel_counts(str)
    vowels = "aeiou"
    counts = Hash.new(0)
    str.each_char do |char|
        if vowels.include?(char.downcase)
            counts[char.downcase] += 1
        end
    end
    counts
end

def caesar_cipher(str, n)
    if n > 26
        while n > 26
            n -= 26
        end
    end
    alph = ("a".."z").to_a
    new_str = ""
    str.each_char do |char|
        if alph.include?(char)        
            idx = alph.index(char)
            new_idx = idx + n
        end
        if !alph.include?(char)
            new_str += char
        elsif new_idx <= 25
            new_str += alph[new_idx]
        else
            new_str += alph[new_idx - 26]
        end
    end
    new_str
end