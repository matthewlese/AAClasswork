class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |letter, i| indices << i if letter == char }
    indices
  end

  def fill_indices(char, arr)
    arr.each do |i|
      @guess_word[i] = char
    end
  end

  #part 2

  def try_guess(guess_char)
    if already_attempted?(guess_char)
      puts "that has already been attempted"
      return false
    end
    @attempted_chars << guess_char
    indices = self.get_matching_indices(guess_char)
    self.fill_indices(guess_char, indices)
    @remaining_incorrect_guesses -= 1 if indices.empty?
    true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guess = gets.chomp
    self.try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      false
    end
  end

end
