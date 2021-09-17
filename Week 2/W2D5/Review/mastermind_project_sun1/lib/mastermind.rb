require_relative "code"

class Mastermind

  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code_instance)
    puts @secret_code.num_exact_matches(code_instance)
    puts @secret_code.num_near_matches(code_instance)
  end

  def ask_user_for_guess
    puts "Enter a code"
    input = gets.chomp
    instance = Code.from_string(input)
    self.print_matches(instance)
    instance.pegs == @secret_code.pegs
  end


end
