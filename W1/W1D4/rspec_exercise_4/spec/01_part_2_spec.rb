require "part_2"

describe "PART 2" do
  describe "proper_factors" do
    it "should accept a number as an arg" do
      expect { proper_factors(6) }.to_not raise_error
    end

    it "should return all positive numbers less than the argument that also divide the argument" do
      expect(proper_factors(6)).to match_array([1,2,3])
      expect(proper_factors(12)).to match_array([1,2,3,4,6])
      expect(proper_factors(9)).to match_array([1,3])
    end
  end

  describe "aliquot_sum" do
    it "should accept a number as an arg" do
      expect { aliquot_sum(9) }.to_not raise_error
    end

    it "should return the sum of all proper factors of the number" do
      expect(aliquot_sum(6)).to eq(6)
      expect(aliquot_sum(12)).to eq(16)
      expect(aliquot_sum(9)).to eq(4)
    end

    it "should call your proper_factors method" do
      allow(self).to receive(:proper_factors).and_return([1,2,3])
      expect(self).to receive(:proper_factors).at_least(:once)
      aliquot_sum(6)
    end
  end

  describe "perfect_number?" do
    it "should accept a number as an arg" do
      expect { perfect_number?(6) }.to_not raise_error
    end

    context "when the number is equal to it's aliquot sum" do
      it "should return true" do
        expect(perfect_number?(6)).to eq(true)
        expect(perfect_number?(28)).to eq(true)
      end
    end

    context "when the number is not equal to it's aliquot sum" do
      it "should return false" do
        expect(perfect_number?(12)).to eq(false)
        expect(perfect_number?(9)).to eq(false)
      end
    end

    it "should call your aliquot_sum method" do
      allow(self).to receive(:aliquot_sum).and_return(6)
      expect(self).to receive(:aliquot_sum).at_least(:once)
      perfect_number?(6)
    end
  end

  describe "ideal_numbers" do
    it "should accept a number, n, as an arg" do
      expect { ideal_numbers(3) }.to_not raise_error
    end

    it "should return an array containing the first n perfect numbers" do
      expect(ideal_numbers(2)).to eq([6, 28])
      expect(ideal_numbers(3)).to eq([6, 28, 496])
    end
  end
end
