def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    arr = str.split(" ")
    new_arr = []
    arr.each { |word| new_arr << prc.call(word) }
    new_arr.join(" ")
end

def greater_proc_value(num, prc_1, prc_2) #arguments are already procs, so no need for a &.  Only use that when argument is a block
    [prc_1.call(num), prc_2.call(num)].max
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []
    arr.each do |ele|
        if prc_1.call(ele) && prc_2.call(ele)
            new_arr << ele
        end
    end
    new_arr
end

def alternating_mapper(arr, prc_1, prc_2)
    new_arr = []
    arr.each_with_index do |ele, idx|
        if idx.even?
            new_arr << prc_1.call(ele)
        else
            new_arr << prc_2.call(ele)
        end
    end
    new_arr
end