class HumanPlayer
  def initialize(name)
    @player_name = name    
  end

  def get_input
    puts "Enter a position in the form of 'x y' "
    gets.chomp.split(" ").map(&:to_i)
  end


end