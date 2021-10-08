class Player
  def get_move
    print "enter a position: "
    gets.chomp.split.map(&:to_i)
  end
end
