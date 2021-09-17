class Human_Player

  def initialize(mark_value)
    @mark = mark_value
  end

  attr_reader :mark

  def get_position
    puts "Please enter a location on the board to place your next #{@mark} e.g. '0 1'"
    input = gets.chomp
    if input.length == 3 && input.count(" ") == 1
      posish = input.split(" ").map(&:to_i)
    else
      raise "Invalid entry"
    end
  end

end