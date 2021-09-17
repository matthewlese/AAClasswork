require_relative "board"
require_relative "player"

class Battleship

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = 0.5 * @board.size
  end

  attr_reader :board, :player

  def start_game
    @board.place_random_ships
    puts @board.num_ships
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      true
    else
      false
    end
  end

  def win?
    if @board.num_ships == 0
      puts "you win"
      true
    else
      false
    end
  end

  def game_over?
    return true if self.lose? || self.win?
    false
  end

  def turn
    move = @player.get_move
    if !@board.attack(move)
      @remaining_misses -= 1
      puts @remaining_misses
    else
      puts @remaining_misses
    end
    @board.print

  end

end
