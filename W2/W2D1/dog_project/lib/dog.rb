class Dog
  def initialize(name, breed, age, bark, favorite_foods) #should accept a name (string), breed (string), age (number), bark (string), and favorite_foods (array) as arguments
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def name
    @name
  end

  def breed
    @breed
  end

  def age
    @age
  end

  def age=(num)
    @age = num
  end

  def bark
    if @age > 3
      return @bark.upcase
    else
      return @bark.downcase
    end
  end

  def favorite_foods
    @favorite_foods
  end

  def favorite_food?(food)
    new_arr = []
    @favorite_foods.each do |food|
      new_arr << food.downcase
    end
    new_arr.include?(food.downcase)
  end

end
