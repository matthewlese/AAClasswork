require "part_1"

describe "PART 1" do
  describe "is_prime?" do
    it "should accept a number as an arg" do
      expect { is_prime?(7) }.to_not raise_error
    end

    context "when the number can only be divided by 1 and itself" do
      it "should return true" do
        expect(is_prime?(2)).to eq(true)
        expect(is_prime?(7)).to eq(true)
        expect(is_prime?(11)).to eq(true)
        expect(is_prime?(13)).to eq(true)
      end
    end

    context "when the number can be divided by numbers other than 1 and itself" do
      it "should return false" do
        expect(is_prime?(4)).to eq(false)
        expect(is_prime?(9)).to eq(false)
        expect(is_prime?(20)).to eq(false)
      end
    end

    context "when the number is less than 2" do
      it "should return false" do
        expect(is_prime?(1)).to eq(false)
        expect(is_prime?(0)).to eq(false)
        expect(is_prime?(-7)).to eq(false)
        expect(is_prime?(-8)).to eq(false)
      end
    end
  end

  describe "nth_prime" do
    it "should accept a number, n, as an arg" do
      expect { nth_prime(5) }.to_not raise_error
    end

    it "should return the nth prime number sequentially" do
      expect(nth_prime(1)).to eq(2)
      expect(nth_prime(2)).to eq(3)
      expect(nth_prime(3)).to eq(5)
      expect(nth_prime(4)).to eq(7)
      expect(nth_prime(300)).to eq(1987)
    end
  end

  describe "prime_range" do
    it "should accept two numbers, min and max, as args" do
      expect { prime_range(4, 17) }.to_not raise_error
    end

    it "should return an array of all prime numbers between min and max" do
      expect(prime_range(4, 17)).to match_array([5, 7, 11, 13, 17])
      expect(prime_range(23, 31)).to match_array([23, 29, 31])
      expect(prime_range(1990, 2000)).to match_array([1993, 1997, 1999])
      expect(prime_range(-10, 1 )).to match_array([])
    end
  end
end
