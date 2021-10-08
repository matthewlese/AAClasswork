class Player

  def initialize(mark)
    @mark = mark
  end
  
  attr_reader :mark

  # This Player#get_position method is given for free and does not need to be modified
  # It is used to make your game playable.
  def get_position
      p "enter a valid position in the form `row col` like `0 1`"
      gets.chomp.split.map(&:to_i)
  end
end
