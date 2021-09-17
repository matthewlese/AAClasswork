require "byebug"

def duos(str)
  count = 0
  (0...str.length - 1).each do |idx|
    count += 1 if str[idx] == str[idx + 1]
  end
  count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hash)
  sent_arr = sent.split(" ")
  new_arr = []
  sent_arr.each do |word|
    if hash.has_key?(word)
      new_arr << hash[word]
    else
      new_arr << word
    end
  end
  new_arr.join(" ")
end

# p sentence_swap('anything you can do I can do',
#   'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#   'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#   'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, proc, &block)
  new_hash = Hash.new()
  hash.each { |k, v| new_hash[block.call(k)] = proc.call(v) }
  new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
  counts = Hash.new(0)
  str.each_char { |char| counts[char] += 1 }
  counts.select! { |k, v| v > 2 }
  counts.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
  (0..str.length - 3).each do |i|
    return true if str[i] == str[i + 1] && str[i] == str[i + 2]
  end
  false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
  new_str = ""
  str.each_char do |char|
    if char == " "
      new_str += " "
    elsif hash.has_key?(char)
      new_str += hash[char]
    else
      new_str += "?"
    end
  end
  new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
  new_str = ""
  i = 0
  while i < str.length
    new_str += (str[i] * str[i + 1].to_i)
    i += 2
  end
  p new_str
end

# uncompress('a2b4c1') # 'aabbbbc'
# uncompress('b1o2t1') # 'boot'
# uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *procs)
  new_arr = []
  arr.each do |ele|
    new_arr << ele if procs.all? { |proc| proc.call(ele) }
  end
  new_arr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
  sent_arr = sent.split(" ")
  new_arr = []
  sent_arr.each do |word|
    if word.length < 3
      new_arr << word
    else
      if "aeiou".include?(word[0].downcase)
        new_arr << word + "yay"
      else
        befores = ""
        after = ""
        word.each_char.with_index do |char, idx|
          if !"aeiou".include?(char)
            befores += char
          else
            after = word[idx..-1]
            break
          end
        end
        new_arr << after + befores + "ay"
      end
    end
  end
  new_arr.join(" ")
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
  sent_arr = sent.split(" ")
  new_arr = []
  sent_arr.each do |word|
    if word.length < 3
      new_arr << word
    else
      if "aeiou".include?(word[-1].downcase)
        new_arr << word + word
      else
        vowels = []
        word.each_char.with_index do |char, i|
          vowels << i if "aeiou".include?(char.downcase)
        end
        new_arr << word + word[vowels[-1]..-1]
      end
    end
  end
  new_arr.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *procs)
  new_arr = []
  arr.each do |ele|
    new_arr << ele if procs.any? { |proc| proc.call(ele) }
  end
  new_arr
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
  sent_arr = sent.split(" ")
  new_arr = []
  sent_arr.each.with_index do |word, idx|
    locations = []
    if word.count("aeiouAEIOU") == 0
      new_arr << word
    else
      word.each_char.with_index do |char, i|
        locations << i if "aeiou".include?(char.downcase)
      end
      if idx == 0 || idx % 2 == 0
        new_arr << word[0...locations[0]] + word[locations[0] + 1..-1]
      else
        new_arr << word[0...locations[-1]] + word[locations[-1] + 1..-1]
      end
    end
  end
  new_arr.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)
  sent_arr = sent.split(" ")
  new_arr = []
  sent_arr.each do |word|
    if "aeiou".include?(word[-1].downcase)
      new_arr << word + word[-1]
    else
      new_word = ""
      word.each_char do |char|
        if "aeiou".include?(char.downcase)
          new_word += char + "b" + char.downcase
        else
          new_word += char
        end
      end
      new_arr << new_word
    end
  end
  new_arr.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str)
  new_str = ""
  i = 0
  # debugger
  while i < str.length
    count = 0
    i2 = i
    while str[i2] == str[i]
      count += 1
      i2 += 1
    end
    if count > 1
      new_str += str[i] + count.to_s
      i += count
    else
      new_str += str[i]
      i += 1
    end
  end
  new_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"