class Room
  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  attr_reader :capacity, :occupants

  def full?
    if @occupants.length < @capacity
      return false
    else
      true
    end
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(name)
    if !self.full?
      @occupants << name
      return true
    else
      false
    end
  end
end
