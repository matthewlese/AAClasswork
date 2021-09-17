require "byebug"

def is_prime?(number)
    (2...number).each do |fac|
        return false if number % fac == 0
    end

    true
end

def first_n_primes(num_primes)
    primes = []
    num = 2

    while primes.length < num_primes
        primes << num if is_prime?(num)
        num += 1
    end

    primes
end

debugger
p first_n_primes(5) # => [2, 3, 5, 7, 11]