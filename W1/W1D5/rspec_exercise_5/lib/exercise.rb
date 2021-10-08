require "byebug"

def zip(arr1, *arrays)
  new_arr = []
  arr1.each.with_index do |ele, i|
    new_subarr = []
    new_subarr << ele
    arrays.each do |arr|
      new_subarr << arr[i]
    end
    new_arr << new_subarr
  end
  new_arr
end

def prizz_proc(arr, prc1, prc2)
  new_arr = []
  arr.each do |ele|    
    new_arr << ele if [prc1.call(ele), prc2.call(ele)].one?
  end
  new_arr
end

def zany_zip(*arrays)
  new_arr = []
  lengths = []
  arrays.each { |arr| lengths << arr.length }
  (0...lengths.max).each do |i|
    new_sub = []
    arrays.each do |arr|
      new_sub << arr[i]
    end
    new_arr << new_sub
  end
  new_arr
end

def maximum(arr, &prc)
  results = Hash.new()
  arr.each do |ele|
    results[ele] = prc.call(ele)
  end
  i = arr.length - 1
  while i >= 0
    if results.values[i] == results.values.max 
      return results.keys[i]
    end
    i -= 1
  end
end

def my_group_by(arr, &prc)
  hash = Hash.new()
  arr.each do |ele1|
    val_arr = []
    arr.each do |ele2|
      val_arr << ele2 if prc.call(ele2) == prc.call(ele1)
    end
    hash[prc.call(ele1)] = val_arr
  end
  hash
end

def max_tie_breaker(arr, prc, &blc)
  if arr.length == 0
    return nil
  end
  results = Hash.new()
  arr.each do |ele|
    results[ele] = blc.call(ele)
  end
  if results.values.one? { |val| val == results.values.max }
    results.key(results.values.max)
  else
    prc_res = Hash.new()
    arr.each do |ele2|
      if blc.call(ele2) == results.values.max
        prc_res[ele2] = prc.call(ele2)
      end
    end
    if prc_res.values.one? { |val2| val2 == prc_res.values.max }
      prc_res.key(prc_res.values.max)
    else
      prc_res.keys.each do |key|
        if prc.call(key) == prc_res.values.max
          return key
        end
      end
    end
  end
end

def silly_syllables(sent)
  sent_arr = sent.split(" ")
  new_arr = []
  sent_arr.each do |word|
    first_index = 0
    last_index = 0
    if word.count("aeiou") < 2
      new_arr << word
    else
      word.each_char.with_index do |char1, i1|
        if "aeiou".include?(char1)
          first_index = i1
          break
        end
      end
      word.reverse.each_char.with_index do |char2, i2|
        if "aeiou".include?(char2)
          last_index = word.length - i2 - 1
          break
        end
      end
      new_arr << word[first_index..last_index]
    end
  end
  new_arr.join(" ")
end