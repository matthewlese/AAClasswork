class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(char_arr) #class method
    char_arr.all? do |char|
      POSSIBLE_PEGS.has_key?(char.upcase)
    end
  end

  def initialize(char_arr) #instance method
    if !Code.valid_pegs?(char_arr) #call class method with class name
      raise "invalid pegs"
    else
      @pegs = char_arr.map(&:upcase)
    end
  end

  attr_reader :pegs

  def self.random(length) #class method
    new_pegs = []
    length.times do |i|
      new_pegs << POSSIBLE_PEGS.keys[rand(0..3)]
    end
    Code.new(new_pegs)
  end

  def self.from_string(peg_str)
    Code.new(peg_str.upcase.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_instance)
    count = 0
    @pegs.each.with_index do |peg, idx| #iterate through actual pegs
      code_instance.pegs.each.with_index do |guess_peg, i| #iterate through code instance arg
        count += 1 if peg == guess_peg && idx == i
      end
    end
    count
  end

  def num_near_matches(code_instance)
    count = 0
    peg_counts = Hash.new(0)
    guess_counts = Hash.new(0)
    @pegs.each { |peg| peg_counts[peg] += 1 }
    code_instance.pegs.each { |guess_peg| guess_counts[guess_peg] += 1 }
    peg_counts.keys.each do |char|
      count += [peg_counts[char], guess_counts[char]].min
    end
    count - self.num_exact_matches(code_instance)
  end

  def ==(code_instance)
    code_instance.pegs == self.pegs
  end

end
