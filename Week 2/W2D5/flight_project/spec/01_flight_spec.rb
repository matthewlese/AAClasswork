require "flight"
require "passenger"

describe "Flight" do
  let(:flight) { Flight.new("AA128", 4) }

  let(:passenger_1) do
    pass = Passenger.new("Rose")
    pass.add_flight("AA128")
    pass
  end

  let(:passenger_2) do
    pass = Passenger.new("Jesse")
    pass.add_flight("XYZ32")
    pass
  end

  let(:passenger_3) do
    pass = Passenger.new("Trevor")
    pass.add_flight("AA128")
    pass
  end

  it "class should be defined" do
    expect(Object.const_defined?("Flight")).to eq(true)
  end

  describe "#initialize" do
    it "should accept a flight number (string) and capacity (number) as an arg" do
      expect { flight }.to_not raise_error
    end

    it "should set @flight_number and @capacity with the given args" do
      expect(flight.instance_variable_get(:@flight_number)).to eq("AA128")
      expect(flight.instance_variable_get(:@capacity)).to eq(4)
    end

    it "should set @passengers to an empty array" do
      expect(flight.instance_variable_get(:@passengers)).to match_array([])
    end
  end

  describe "#passengers" do
    it "should return @passengers" do
      expect(flight.passengers).to be(flight.instance_variable_get(:@passengers))
    end
  end

  describe "#full?" do
    context "when the number of @passengers has reached @capacity" do
      it "should return true" do
        4.times { flight.passengers << passenger_1 }
        expect(flight.full?).to eq(true)
      end
    end

    context "when the number of @passengers is below @capacity" do
      it "should return false" do
        expect(flight.full?).to eq(false)
        3.times { flight.passengers << passenger_1 }
        expect(flight.full?).to eq(false)
      end
    end
  end

  describe "#board_passenger" do
    it "should accept a Passenger instance as an arg" do
      expect { flight.board_passenger(passenger_1) }.to_not raise_error
    end

    context "when the passenger has the @flight_number" do
      it "should add the passenger instance to @passengers" do
        flight.board_passenger(passenger_1)
        expect(flight.passengers).to match_array([passenger_1])
      end
    end

    context "when the passenger does not have the @flight_number" do
      it "should not add the passenger instance to @passengers" do
        flight.board_passenger(passenger_2)
        expect(flight.passengers).to match_array([])
      end
    end

    it "should never add a passenger if the flight is full" do
      5.times { flight.board_passenger(passenger_1) }
      expect(flight.passengers.length).to eq(4)
    end

    it "should call #full?" do
      allow(flight).to receive(:full?).and_return(false)
      expect(flight).to receive(:full?).at_least(:once)
      flight.board_passenger(passenger_1)
    end

    it "should call Passenger#has_flight? on the arg" do
      allow(passenger_1).to receive(:has_flight?).and_return(true)
      expect(passenger_1).to receive(:has_flight?).at_least(:once)
      flight.board_passenger(passenger_1)
    end
  end

  describe "#list_passengers" do
    it "should return an array containing the names of all of the @passengers" do
      flight.instance_variable_set(:@passengers, [passenger_1, passenger_3])
      expect(flight.list_passengers).to match_array(["Rose", "Trevor"])
    end
  end

  describe "#[]" do
    it "should accept an index (number) as an arg" do
      expect { flight[0] }.to_not raise_error
    end

    it "should return the element at the given index in @passengers" do
      flight.instance_variable_set(:@passengers, [passenger_1, passenger_3])
      expect(flight[0]).to be(passenger_1)
      expect(flight[1]).to be(passenger_3)
    end
  end

  describe "#<<" do
    it "should accept a Passenger instance as an arg" do
      expect { flight << passenger_1 }.to_not raise_error
    end

    it "should call #board_passenger, passing in the arg" do
      expect(flight).to receive(:board_passenger).with(passenger_1)
      flight << passenger_1
    end
  end
end
