# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    facs1 = get_divisors(num_1)
    facs2 = get_divisors(num_2)
    facs1.each do |ele1|
        facs2.each do |ele2|
            if ele1 == ele2
                return false
            end
        end
    end
    return true
end

def get_divisors(num)
    divisors = []
    (2..(num / 2)).each do |fac|
        if num % fac == 0
            divisors << fac
        end
    end
    divisors
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
