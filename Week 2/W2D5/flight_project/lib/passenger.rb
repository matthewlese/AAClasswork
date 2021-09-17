class Passenger

  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  attr_reader :name

  def has_flight?(flight_num_str)
    return true if @flight_numbers.include?(flight_num_str.upcase)
    false
  end

  def add_flight(flight_num_str)
    if !self.has_flight?(flight_num_str)
      @flight_numbers << flight_num_str.upcase
    end
  end

end