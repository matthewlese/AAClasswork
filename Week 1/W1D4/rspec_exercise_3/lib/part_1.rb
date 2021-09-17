def is_prime?(num)
    return false if num < 2
    (2...num).each do |fac|
        return false if num % fac == 0
    end
    true
end

def nth_prime(n)
    primes = []
    i = 2
    while primes.length < n
        primes << i if is_prime?(i)
        i += 1
    end
    primes[-1]
end

def prime_range(min, max)
    arr = []
    (min..max).each do |num|
        arr << num if is_prime?(num)
    end
    arr
end