require_relative "code"

class Mastermind

  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code_instance)
    exacts = @secret_code.num_exact_matches(code_instance)
    nears = @secret_code.num_near_matches(code_instance)
    puts "Number of exact matches: #{exacts}"
    puts "Number of near matches: #{nears}"
  end

  def ask_user_for_guess
    puts "Enter a code"
    guess_str = gets.chomp
    new_instance = Code.from_string(guess_str)
    self.print_matches(new_instance)
    new_instance == @secret_code
  end

end
