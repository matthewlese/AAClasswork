
require_relative "employee"

class Manager < Employee

  attr_accessor :employees, :salary

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    bonus = self.bonus_helper * multiplier
  end

  def bonus_helper
    salary_sum = 0
    self.employees.each do |subordinate|
      salary_sum += subordinate.salary
      if subordinate.is_a?(Manager)
        salary_sum += subordinate.bonus_helper
      end
    end
    salary_sum
  end

end

# tim = Manager.new("tim", "CEO", 100000, "bill")
# sam = Employee.new("sam", "janitor", 60000, tim)
# jeff = Manager.new("jeff", "VP", 100000, tim)
# barbara = Employee.new("barbara", "VP", 90000, jeff)
# kyle = Employee.new("kyle", "HR rep", 70000, tim)
# jeff.employees << barbara
# tim.employees += [sam, kyle, jeff]
# p tim.bonus(1.5)