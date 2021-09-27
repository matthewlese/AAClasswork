def first_anagram?(str1, str2)
  anagrams = str1.split("").permutation(str1.length).to_a
  anagrams.map! { |anagram| anagram.join("") }
  anagrams.include?(str2)
end

def second_anagram?(str1, str2)
  str2_array = str2.split("")
  str1.each_char.with_index do |char, idx|
    idx2 = str2_array.index(char)
    return false if idx2 == nil
    str2_array.delete_at(idx2)
  end
  str2_array.join("") == ""
end

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char { |char| hash1[char] += 1 }
  str2.each_char { |char| hash2[char] += 1 }
  hash1 == hash2
end

p fourth_anagram?("cat", "toooooooooooc")
p fourth_anagram?("cat", "tac")