def sum_to(n)
  return nil if n < 1
  return n if n == 1
  n + sum_to(n - 1)
end

# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil

def add_numbers(nums_array)
  return nums_array[0] if nums_array.size <= 1
  nums_array[0] + add_numbers(nums_array[1..-1])
end

# add_numbers([1,2,3,4]) # => returns 10
# add_numbers([3]) # => returns 3
# add_numbers([-80,34,7]) # => returns -39
# add_numbers([]) # => returns nil

def gamma_fnc(n) #(n-1)!
  return nil if n <= 0
  return 1 if n <= 1
  (n - 1) * gamma_fnc(n - 1)
end

# gamma_fnc(0)  # => returns nil
# gamma_fnc(1)  # => returns 1
# gamma_fnc(4)  # => returns 6
# gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
  return true if flavors[0] == favorite
  return false if flavors.size == 0
  ice_cream_shop(flavors[1..-1], favorite)
end

# ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
  return string if string.length <= 0
  string[-1] + reverse(string[0..-2])
end

# reverse("house") # => "esuoh"
# reverse("dog") # => "god"
# reverse("atom") # => "mota"
# reverse("q") # => "q"
# reverse("id") # => "di"
# reverse("") # => ""