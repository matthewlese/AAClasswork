require "part_2"

describe "PART 2" do
  describe "element_count" do
    it "should accept an array as an arg" do
      expect { element_count(["cat", "dog", "cat", "cat"]) }.to_not raise_error
    end

    it "should return a hash where each key is an element of the array and it's corresponding value is the number of times it appears in the array" do
      expect(element_count(["cat", "dog", "cat", "cat"])).to eq({"cat" => 3, "dog"=>1})
      expect(element_count(["a", "b", "c", "c"])).to eq({"a" => 1, "b"=>1, "c"=>2})
      expect(element_count([true, true, false, true, true])).to eq({true=>4, false=>1})
    end
  end

  describe "char_replace!" do
    it "should accept a string and a hash as args" do
        expect { char_replace!("hello world", {"l"=>"7", "e"=>"a", " "=>"-", "o"=>"q"}) }.to_not raise_error
    end

    it "should mutate the original string by replacing chars of the string with their corresponding values in the hash, if the char is a key of the hash" do
      string_1 = "hello world"
      char_replace!(string_1, {"l"=>"7", "e"=>"a", " "=>"-", "o"=>"q"})
      expect(string_1).to eq("ha77q-wqr7d")


      string_2 = "pizza"
      char_replace!(string_2, {"z"=>"x", "t"=>"f", "e"=>"a"})
      expect(string_2).to eq("pixxa")
    end

    it "should return the mutated string" do
      str = "hello world"
      expect(char_replace!(str, {"l"=>"7", "e"=>"a", " "=>"-", "o"=>"q"})).to be(str)
    end
  end

  describe "product_inject" do
    it "should accept an array of numbers as an arg" do
      expect { product_inject([4, 2, 5]) }.to_not raise_error
    end

    it "should return the total product of all elements multiplied together" do
      expect(product_inject([4, 2, 5])).to eq(40)
      expect(product_inject([4, 2, 5, 3])).to eq(120)
      expect(product_inject([7, 2])).to eq(14)
      expect(product_inject([3])).to eq(3)
    end

    it "should use Array#inject on the array to calculate the answer" do
      answer = double("the answer")
      array = [4, 2, 5]
      allow(array).to receive(:inject).and_return(answer)
      expect(product_inject(array)).to be(answer)
    end
  end
end
