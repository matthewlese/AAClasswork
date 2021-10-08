class Array
  require "byebug"

  def my_each(&prc) #takes in a block
    self.length.times do |i| #iterate through array the method is called on
      prc.call(self[i]) #pass element into block
    end
    self
  end

  def my_select(&prc)
    new_arr = [] #selected elements will go here
      self.my_each do |el| #iterate through array
        new_arr << el if prc.call(el) #shovel in trues
      end
    new_arr #return
  end

  def my_reject(&prc)
    new_arr = []
    self.my_each do |el|
      new_arr << el if !prc.call(el) #key word 'unless' would work here too
    end
    new_arr
  end

  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
      return false if !prc.call(ele) #unless
    end
    true
  end

  def my_flatten
    new_arr = [] #will be 1d version
    self.my_each do |el|
      if !el.is_a?(Array) #if element is not an array
        new_arr << el #send it straight into the new arr
      else #if element is an array
        new_arr += el.my_flatten #recursively call flatten on it, then concatenate
      end
    end
    new_arr
  end

  def my_zip(*args) #accept any num of args
    new_arr = []
    self.length.times do |i| #number of subarrays equal to self.length
      new_sub = [self[i]] #initialize with self[i]
      args.my_each do |arg|
        new_sub << arg[i] #shovel in arg[i]
      end
      new_arr << new_sub #add to major arr
    end
    new_arr
  end

  def my_rotate(n=1)
    split_idx = n % self.length #1 % 4 = 3; 15 % 4 = 3
    self.drop(split_idx) + self.take(split_idx)
    #drop drops first 3 elements, returns remaining
    #take takes the first 3
  end

  def my_join(separator = "") #by default, nothing goes between eles
    str = ""
    self.length.times do |i| #cover each element
      str += self[i]
      str += separator unless i == self.length - 1
      #don't add separator to the end!
    end
    str
  end

  def my_reverse
    new_arr = []
    self.my_each do |el|
      new_arr.unshift(el) #adds el to the front
    end
    new_arr
  end

end

[ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
[ 1 ].my_reverse               #=> [1]