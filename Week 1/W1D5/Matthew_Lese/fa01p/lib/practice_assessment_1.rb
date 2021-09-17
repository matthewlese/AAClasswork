# Define your methods here. 
def first_letter_vowel_count(sent)
  count = 0
  sent.split(" ").each { |word| count += 1 if "aeiou".include?(word[0].downcase) }
  count
end

def count_true(arr, prc)
  count = 0
  arr.each { |ele| count += 1 if prc.call(ele) }
  count
end

def procformation(arr, prc1, prc2, prc3)
  new_arr = []
  arr.each do |ele|
    if prc1.call(ele)
      new_arr << prc2.call(ele)
    else
      new_arr << prc3.call(ele)
    end
  end
  new_arr
end

def array_of_array_sum(arr)
  arr.flatten.sum
end

def selective_reverse(sent)
  arr = sent.split(" ")
  new_arr = []
  arr.each do |word|
    if "aeiou".include?(word[0].downcase) || "aeiou".include?(word[-1].downcase)
      new_arr << word
    else
      new_arr << word.reverse
    end
  end
  new_arr.join(" ")
end

def hash_missing_keys(hash, *args)
  new_arr = []
  args.each do |arg|
    if !hash.has_key?(arg)
      new_arr << arg
    end
  end
  new_arr
end
