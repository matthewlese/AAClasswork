class Flight

  def initialize(flight_num_str, capacity)
    @flight_number = flight_num_str
    @capacity = capacity
    @passengers = []
  end

  def passengers
    @passengers
  end

  def full?
    return true if @passengers.size == @capacity
    false
  end

  def board_passenger(passenger)
    if !self.full?
      @passengers << passenger if passenger.has_flight?(passenger.)
    end
  end

  def list_passengers

  end

  def [](index)
    @passengers[index]
  end

  def <<(passenger)
    self.board_passenger(passenger)
  end

end