require "player"

describe "Player" do
    let(:player) { Player.new(:X) }

    describe "#initialize" do
        it "should accept a mark as an arg" do
            expect { player }.to_not raise_error
        end

        it "should set @mark to the given arg" do
            expect(Player.new(:X).instance_variable_get(:@mark)).to eq(:X)
            expect(Player.new(:O).instance_variable_get(:@mark)).to eq(:O)
            expect(Player.new(:P).instance_variable_get(:@mark)).to eq(:P)
        end
    end

    describe "#mark" do
        it "should return @mark" do
            test_mark = double("mark")
            expect(Player.new(test_mark).mark).to be(test_mark)
        end
    end
end
