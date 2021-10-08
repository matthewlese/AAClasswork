require "employee"
require "byebug"

class Startup

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  attr_reader :name, :funding, :salaries, :employees

  def valid_title?(title)
    @salaries.keys.include?(title)
  end

  def >(competitor)
    competitor.funding < self.funding
  end

  def hire(employee_name, input_title)
    if valid_title?(input_title)
      @employees << Employee.new(employee_name, input_title)
    else
      raise "invalid title"
    end
  end

  def size
    @employees.count
  end

  def pay_employee(employee)
    if @funding >= @salaries[employee.title]
      employee.pay(@salaries[employee.title])
      @funding -= @salaries[employee.title]
    else
      raise "you're not solvent"
    end
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee) }
  end

  #part 3

  def average_salary
    total_salary = 0
    @employees.each { |employee| total_salary += @salaries[employee.title] }
    total_salary * 1.0 / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    other_startup.salaries.each { |title, salary| @salaries[title] = salary if !@salaries.has_key?(title) }
    @employees += other_startup.employees
    other_startup.close
  end

end
