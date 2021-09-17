class Code

  require "byebug"

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def self.valid_pegs?(char_arr)
    char_arr.all? do |char| 
      POSSIBLE_PEGS.has_key?(char.upcase)
    end
  end

  def initialize(char_arr)
    if Code.valid_pegs?(char_arr)
      @pegs = char_arr.map { |char| char.upcase }
    else
      raise 'error'
    end
  end

  attr_reader :pegs

  def self.random(length)
    pegs = []
    length.times do
      i = rand(0..3)
      pegs << POSSIBLE_PEGS.keys[i]
    end
    Code.new(pegs)
  end

  def self.from_string(peg_string)
    arr = peg_string.upcase.split("")
    Code.new(arr)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    correct = 0
    guess.pegs.each.with_index do |peg, idx|
      correct += 1 if @pegs[idx] == peg
    end
    correct
  end

  def num_near_matches(guess)
    similarities = 0
    guess_counts = Hash.new(0)
    counts = Hash.new(0)
    guess.pegs.each { |guess_peg| guess_counts[guess_peg] += 1 }
    @pegs.each { |off_peg| counts[off_peg] += 1 }
    guess_counts.each_key do |k|
      similarities += [counts[k], guess_counts[k]].min if counts.has_key?(k)
    end
    similarities - self.num_exact_matches(guess)
  end

  def ==(code_instance)
    self.pegs == code_instance.pegs
  end
  
end
