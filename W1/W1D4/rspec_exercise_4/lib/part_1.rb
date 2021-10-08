def my_reject(arr, &prc)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if !prc.call(ele)
    end
    new_arr
end

def my_one?(arr, &prc)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if prc.call(ele)
    end
    if new_arr.count == 1
        true
    else
        false
    end
end

def hash_select(hash, &prc)
    new_hash = Hash.new()
    hash.each do |k, v|
        if prc.call(k, v)
            new_hash[k] = v
        end
    end
    new_hash
end

def xor_select(arr, prc1, prc2)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if ((prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele)))
    end
    new_arr
end

def proc_count(val, arr)
    count = 0
    arr.each do |prc|
        count += 1 if prc.call(val)
    end
    count
end