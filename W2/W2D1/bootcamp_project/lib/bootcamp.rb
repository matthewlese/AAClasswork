class Bootcamp
  def initialize(name, slogan, student_capacity) #should accept a name (string), slogan (string), and student_capacity (number) as args
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] }
  end
  def name
    @name
  end
  def slogan
    @slogan
  end
  def teachers
    @teachers
  end
  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students << student
      return true
    end
    false
  end

  def enrolled?(student)
    return true if @students.include?(student)
    false
  end

  #part 2

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    return false if !self.enrolled?(student)
    @grades[student] << grade
    true
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    return nil if !self.enrolled?(student) || @grades[student].length == 0
    @grades[student].sum / @grades[student].length
  end

end
