require_relative "HumanPlayer.rb"
require_relative "board.rb"
require "byebug"
class Game

  def initialize(size)
    @board = Board.new(size)
    @board.populate
    @prev_guess = nil
    @player = HumanPlayer.new('jeff')
  end

  attr_reader :board
  attr_accessor :prev_guess
  
  def make_guess
    self.board.render
    
    #guess 1 logic
    guess_1 = @player.get_input
    @board.reveal(guess_1)
    @prev_guess = guess_1
    system("clear")
    self.board.render

    #guess 2 logic
    guess_2 = @player.get_input
    system("clear")
    @board.reveal(guess_2)
    self.board.render
    if @board[guess_1].face_value != @board[guess_2].face_value
      @board[guess_1].hide
      @board[guess_2].hide
    end
    sleep(3)
    system("clear")
    self.board.render

    @prev_guess = nil
  end

  def play
    while !self.board.won?
      self.make_guess
      system("clear")
    end
    puts "You win!"
  end

end

game = Game.new(4)
game.board.cheat
game.play