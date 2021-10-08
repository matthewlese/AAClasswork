class Game
  require_relative "board"
  require_relative "human_player"

  def initialize(player1_mark, player2_mark)
    @player_1 = Human_Player.new(player1_mark)
    @player_2 = Human_Player.new(player2_mark)
    @board = Board.new
    @current_player = @player_1
  end

  attr_reader :player_1, :player_2, :board, :current_player
  attr_writer :current_player

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
    elsif @current_player == @player_2
      @current_player = @player_1
    else
      raise "error with current_player"
    end
  end

  def play
    while @board.empty_positions?
      @board.print
      new_posish = @current_player.get_position
      @board.place_mark(new_posish, @current_player.mark)
      if @board.win?(@current_player.mark) #current_player has won? 
        puts "Sweet, sweet, sweet victory YAH! #{@current_player.mark}"
        return
      else
        self.switch_turn
      end
    end
    puts "Draw"
  end

end