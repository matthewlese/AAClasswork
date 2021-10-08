# Define your methods here.
def string_map!(str, &block)
  str.each_char.with_index { |char, i| str[i] = block.call(char) }
end

def three?(arr, &block)
  count = 0
  arr.each { |ele| count += 1 if block.call(ele) }
  count == 3
end

def nand_select(arr, prc1, prc2)
  new_arr = []
  arr.each { |ele| new_arr << ele if !(prc1.call(ele) && prc2.call(ele)) }
  new_arr
end

def hash_of_array_sum(hash)
  hash.values.flatten.sum
end

def abbreviate(sent)
  sent_arr = sent.split(" ")
  new_arr = []
  sent_arr.each do |word|
    if word.length <= 4
      new_arr << word
    else
      new_word = ""
      word.each_char { |char| new_word += char if !"aeiou".include?(char.downcase) }
      new_arr << new_word
    end
  end
  new_arr.join(" ")
end

def hash_selector(hash, *args)
  return hash if args.length == 0
  final_hash = Hash.new()
  args.each { |arg| final_hash[arg] = hash[arg] if hash.has_key?(arg) }
  final_hash
end