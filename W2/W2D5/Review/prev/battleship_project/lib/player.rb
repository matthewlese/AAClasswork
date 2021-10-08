class Player
  def get_move
    puts "enter a position with coordinates separated witha  space like '4 7'"
    input = gets.chomp.split(" ")
    input.map {|ele| ele.to_i }
  end
end
