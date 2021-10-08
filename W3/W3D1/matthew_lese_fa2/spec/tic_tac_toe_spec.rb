require 'tic_tac_toe'
require 'player'

describe "TicTacToe" do
    let(:tic_tac_toe) { TicTacToe.new }

    describe "#initialize" do
        it "should accept an optional number argument representing a `size`" do
            expect { TicTacToe.new }.to_not raise_error
            expect { TicTacToe.new(5) }.to_not raise_error
        end

        context "when a `size` argument is given" do
            it "should set @board to a Board instance with dimensions `size` x `size`" do
                expect(TicTacToe.new(5).instance_variable_get(:@board).size).to eq(5)
                expect(TicTacToe.new(7).instance_variable_get(:@board).size).to eq(7)
            end
        end

        context "when a `size` argument is not given" do
            it "should set @board to a Board instance with dimensions 3 x 3" do
                expect(TicTacToe.new.instance_variable_get(:@board).size).to eq(3)
            end
        end

        it "should set @player_1 to a Player instance with a mark of :X" do
            player_1 = tic_tac_toe.instance_variable_get(:@player_1)
            expect(player_1).to be_an_instance_of(Player)
            expect(player_1.mark).to eq(:X)

        end

        it "should set @player_2 to a Player instance with a mark of :O" do
            player_2 = tic_tac_toe.instance_variable_get(:@player_2)
            expect(player_2).to be_an_instance_of(Player)
            expect(player_2.mark).to eq(:O)
        end

        it "should set @current_player to @player_1" do
            player_1 = tic_tac_toe.instance_variable_get(:@player_1)
            expect(player_1).to be_an_instance_of(Player)
            expect(tic_tac_toe.instance_variable_get(:@current_player)).to be(player_1)
        end
    end

    describe "#switch_players!" do
        it "should set @current_player to the other player" do
            player_1 = tic_tac_toe.instance_variable_get(:@player_1)
            player_2 = tic_tac_toe.instance_variable_get(:@player_2)

            expect(tic_tac_toe.instance_variable_get(:@current_player)).to be (player_1)
            tic_tac_toe.switch_players!
            expect(tic_tac_toe.instance_variable_get(:@current_player)).to be (player_2)
            tic_tac_toe.switch_players!
            expect(tic_tac_toe.instance_variable_get(:@current_player)).to be (player_1)
        end
    end

    describe "#play_turn" do
        it "should get the position that the @current_player would like to play for their turn" do
            player = tic_tac_toe.instance_variable_get(:@current_player)
            allow(player).to receive(:get_position).and_return([1, 1])
            expect(player).to receive(:get_position)
            tic_tac_toe.play_turn
        end

        it "should set the @current_player's desired position on the @board to their mark" do
            board = tic_tac_toe.instance_variable_get(:@board)
            player = tic_tac_toe.instance_variable_get(:@current_player)
            test_pos = [1, 1]
            allow(player).to receive(:get_position).and_return(test_pos)

            tic_tac_toe.play_turn
            expect(board[test_pos]).to eq(player.mark)
        end

        it "should use the Board#[]= method to manipulate the @board" do
            board = tic_tac_toe.instance_variable_get(:@board)
            player = tic_tac_toe.instance_variable_get(:@current_player)
            allow(player).to receive(:get_position).and_return([1, 1])

            expect(board).to receive(:[]=)
            tic_tac_toe.play_turn
        end

        it "should switch players to end the turn" do
            player = tic_tac_toe.instance_variable_get(:@current_player)
            allow(player).to receive(:get_position).and_return([1, 1])
            allow(tic_tac_toe).to receive(:switch_players!)
            expect(tic_tac_toe).to receive(:switch_players!)
            tic_tac_toe.play_turn
        end
    end
end
