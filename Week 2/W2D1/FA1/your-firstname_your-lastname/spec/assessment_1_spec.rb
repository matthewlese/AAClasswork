require "assessment_1"

describe "#string_map!" do
    it "should accept a string and a block as args" do
        expect { string_map!("Apple Cider") { |char| char.upcase } }.to_not raise_error
    end

    it "should mutate the input string by replacing each character with its result when passed into the block" do
        str_1 = "Apple Cider"
        string_map!(str_1) { |char| char.upcase }
        expect(str_1).to eq("APPLE CIDER")

        str_2 = "bootcamp"
        string_map!(str_2) do |char|
            if "aeiou".include?(char)
                "."
            else
                char
            end
        end
        expect(str_2).to eq("b..tc.mp")
    end
end

describe "#three?" do
    it "should accept an array and a block as args" do
        expect { three?([2017, 4, 1, 13, 6]) { |n| n.odd? } }.to_not raise_error
    end

    it "should return a boolean indicating if there are exactly three elements of the array that return true when passed into the block" do
        expect(three?([2017, 4, 1, 13, 6]) { |n| n.odd? }).to eq(true)
        expect(three?([27, 5, 1]) { |n| n.odd? }).to eq(true)
        expect(three?(["phone", 'booth', "street", "song"]) { |str| str.include?("o") }).to eq(true)
        expect(three?([8, 5, 7, 13, 11]) { |n| n.odd? }).to eq(false)
        expect(three?([2, 1]) { |n| n.odd? }).to eq(false)
        expect(three?(["phone", 'booth', "poem", "song"]) { |str| str.include?("o") }).to eq(false)
    end
end

describe "#nand_select" do
    let(:even) { Proc.new { |n| n.even? } }
    let(:positive) { Proc.new { |n| n > 0 } }
    let(:all_uppercase) { Proc.new { |x| x == x.upcase } }
    let(:starts_with_a) { Proc.new { |x| x[0].downcase == 'a' } }

    it "should accept an array and two procs as args" do
        expect { nand_select([-2, -4, 7, 6, 8], even, positive) }.to_not raise_error
    end

    it "should return a new array containing elements of the original array, except those that return true when passed into both" do
        expect(nand_select([-2, -4, 7, 6, 8], even, positive)).to eq([-2, -4, 7])
        expect(nand_select([10, 11, 13, 12], even, positive)).to eq([11, 13])
        expect(nand_select(['potato', 'ORANGE', 'ASPARAGUS', 'toMATO', 'APPLE'], all_uppercase, starts_with_a)).to eq(["potato", "ORANGE", "toMATO"])
        expect(nand_select(['app', 'ACADEMY', 'bootcamp', 'CODING'], all_uppercase, starts_with_a)).to eq(["app", "bootcamp", "CODING"])
    end
end

describe "#hash_of_array_sum" do
    let(:hash_1) do
        {
            a: [4, 7, -2, 1],
            b: [5, 10]
        }
    end

    let (:hash_2) do
        {
            one: [32, 8, 0],
            two: [-7],
            three: []
        }
    end

    it "should accept a hash containing arrays as values" do
        expect { hash_of_array_sum(hash_1) }.to_not raise_error
    end

    it "should return the total sum of all arrays in the hash" do
        expect(hash_of_array_sum(hash_1)).to eq(25)
        expect(hash_of_array_sum(hash_2)).to eq(33)
    end
end

describe "#abbreviate" do
    it "should accept a sentence string as an arg" do
        expect { abbreviate("follow the yellow brick road") }.to_not raise_error
    end

    it "should return a new sentence where words longer than 4 characters have their vowels (a, e, i, o, u) removed" do
        expect(abbreviate("follow the yellow brick road")).to eq("fllw the yllw brck road")
        expect(abbreviate("try to stay awake please")).to eq("try to stay wk pls")
        expect(abbreviate("STOP THAT RACKET NOW")).to eq("STOP THAT RCKT NOW")
    end
end

describe "hash_selector" do
    it "should accept a hash and any number of additional arguments" do
        expect { hash_selector({"z"=> true, "f"=>-1, "c"=>32}) }.to_not raise_error
        expect { hash_selector({"z"=> true, "f"=>-1, "c"=>32}, "z") }.to_not raise_error
        expect { hash_selector({"z"=> true, "f"=>-1, "c"=>32}, "z", "c") }.to_not raise_error
    end

    it "should return a new hash containing keys of the original hash that were passed in as additional arguments" do
        expect(hash_selector({"z"=> true, "f"=>-1, "c"=>32}, "z", "c")).to eq({"z"=>true, "c"=>32})
        expect(hash_selector({"z"=> true, "f"=>-1, "c"=>32}, "f")).to eq({"f"=>-1})
        expect(hash_selector({0=>"null", 1=>"ein", 2=>"zwei", 3=>"drei" }, 0, 3, 1)).to eq({0=>"null", 1=>"ein", 3=>"drei"})
    end


    context "when no additional arguments are passed" do
        it "should return the original hash" do
            expect(hash_selector({0=>"null", 1=>"ein", 2=>"zwei", 3=>"drei" })).to eq({0=>"null", 1=>"ein", 2=>"zwei", 3=>"drei"})
        end
    end
end
