def proper_factors(num)
    facs = []
    (1...num).each do |fac|
        facs << fac if num % fac == 0
    end
    facs
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    return true if aliquot_sum(num) == num
    false
end

def ideal_numbers(n)
    perfect_nums = []
    i = 1
    while perfect_nums.length < n
        perfect_nums << i if perfect_number?(i)
        i += 1
    end
    perfect_nums
end