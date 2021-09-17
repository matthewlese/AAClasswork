require "set"
require_relative "player"

class GhostGame
  ALPHABET = Set.new("a".."z")
  MAX_LOSS_COUNT = 5 #class constant five (length of 'ghost')

  def intialize(*players)
    words = File.readlines("dictionary.txt").map(&:chomp) #read file in directory
    @dictionary = Set.new(words)
    @players = players
    @losses = Hash.new { |losses, player| losses[player] = 0}
  end

  def run
    play_round until game_over?
    puts "#{winner} wins!"
  end

  private

  attr_reader :fragment, :dictionary, :losses, :players

  def game_over?
    remaining_players == 1 #once all but one player has remaining mvoes
  end

  def play_round
    @fragment = ""
    welcome

    
  end

end