require "passenger"

describe "Passenger" do
  let(:passenger) { Passenger.new("Rose") }

  it "class should be defined" do
    expect(Object.const_defined?("Passenger")).to eq(true)
  end

  describe "#initialize" do
    it "should accept a name as an arg" do
      expect { passenger }.to_not raise_error
    end

    it "should set @name with the given arg" do
      expect(passenger.instance_variable_get(:@name)).to eq("Rose")
    end

    it "should set @flight_numbers to be an empty array" do
      expect(passenger.instance_variable_get(:@flight_numbers)).to match_array([])
    end
  end

  describe "#name" do
    it "should get @name" do
      expect(passenger.name).to be(passenger.instance_variable_get(:@name))
    end
  end

  describe "#name=" do
    it "setter should not be defined" do
      expect(passenger).to_not respond_to(:name=)
    end
  end

  describe "#flight_numbers" do
    it "getter should not be defined" do
      expect(passenger).to_not respond_to(:flight_numbers)
    end
  end

  describe "#flight_numbers=" do
    it "setter should not be defined" do
      expect(passenger).to_not respond_to(:flight_numbers=)
    end
  end

  describe "#has_flight?" do
    it "should accept a flight number (string) as an arg" do
      expect { passenger.has_flight?("AA128") }.to_not raise_error
    end

    context "when @flight_numbers contains the given number" do
      it "should return true" do
        passenger.instance_variable_set(:@flight_numbers, ["J512", "AA128"])

        expect(passenger.has_flight?("J512")).to eq(true)
        expect(passenger.has_flight?("AA128")).to eq(true)
        expect(passenger.has_flight?("aa128")).to eq(true)
      end
    end

    context "when @flight_numbers does not contain the given number" do
      it "should return false" do
        passenger.instance_variable_set(:@flight_numbers, ["J512", "AA128"])
        expect(passenger.has_flight?("MB512")).to eq(false)
        expect(passenger.has_flight?("AA")).to eq(false)
      end
    end
  end

  describe "#add_flight" do
    it "should accept a flight number (string) as an arg" do
      expect { passenger.add_flight("AA128") }.to_not raise_error
    end

    context "when the passenger doesn't already have the given flight number" do
      it "should add the number to @flight_numbers" do
        passenger.add_flight("AA128")
        expect(passenger.instance_variable_get(:@flight_numbers)).to match_array(["AA128"])
      end

      it "should uppercase the number before adding it to @flight_numbers" do
        passenger.add_flight("aa128")
        expect(passenger.instance_variable_get(:@flight_numbers)).to match_array(["AA128"])
      end
    end

    context "when the passenger already has the given flight number" do
      it "should not add the duplicate number to @flight_numbers" do
        passenger.instance_variable_set(:@flight_numbers, ["J512", "AA128"])
        passenger.add_flight("AA128")
        expect(passenger.instance_variable_get(:@flight_numbers)).to match_array(["J512","AA128"])
      end
    end

    it "should use #has_flight?" do
      allow(passenger).to receive(:has_flight).and_return(false)
      expect(passenger).to receive(:has_flight?).at_least(:once)

      passenger.add_flight("AA128")
    end
  end
end
