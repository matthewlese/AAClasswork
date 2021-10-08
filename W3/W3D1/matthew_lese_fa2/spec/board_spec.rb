require 'board'

describe "Board" do
    let(:small_board) { Board.new(3) }
    let(:big_board) { Board.new(10) }

    it "should not have a #grid method" do
         expect(small_board).to_not respond_to(:grid)
    end

    it "should not have a #size= method" do
        expect(small_board).to_not respond_to(:size=)
    end

    it "should not have a #grid= method" do
        expect(small_board).to_not respond_to(:grid=)
    end

    describe "#initialize(size)" do
        it "should accept a number (size) as an arg" do
            expect { small_board }.to_not raise_error
        end

        it "should set @size to the given size arg" do
            expect(small_board.instance_variable_get(:@size)).to eq(3)
            expect(big_board.instance_variable_get(:@size)).to eq(10)
        end

        it "should set @grid to a 2D array with @size rows and @size columns" do
            small_grid = small_board.instance_variable_get(:@grid)
            expect(small_grid.length).to eq(3)
            expect(small_grid[0].length).to eq(3)
        end

        it "should set @grid to a 2D array where the inner arrays are unique in memory" do
            big_grid = big_board.instance_variable_get(:@grid)
            row_ids = big_grid.map { |row| row.object_id }
            expect(row_ids.uniq).to eq(row_ids)
        end
    end

    describe "#size" do
        it "should get @size" do
            expect(small_board.size).to eq(3)
            expect(big_board.size).to eq(10)
        end
    end

    describe "#[](pos)" do
        it "should accept an array containing two numbers, representing a row index and col index" do
            expect { small_board[[1, 2]] }.to_not raise_error
        end

        it "should return the element of the grid at the given position" do
            mark = double("mark")
            small_grid = small_board.instance_variable_get(:@grid)
            small_grid[1][2] = mark

            expect(small_board[[1,2]]).to be(mark)
        end
    end

    describe "#[]=(pos, mark)" do
        it "should accept a position and mark as args" do
            expect { small_board[[1, 2]] = :X }.to_not raise_error
        end

        it "should assign the mark to the given position of the grid" do
            pos = [0, 1]

            small_board[pos] = :X
            expect(small_board[pos]).to eq(:X)

            small_board[pos] = :O
            expect(small_board[pos]).to eq(:O)
        end
    end

    describe "#complete_row?(mark)" do
        it "should accept a mark as an arg" do
            expect { small_board.complete_row?(:X) }.to_not raise_error
        end

        it "should return a boolean indicating if any row of the grid is completely filled with the mark" do
            expect(small_board.complete_row?(:X)).to eq(false)

            small_board[[2, 0]] = :X
            small_board[[2, 1]] = :X
            expect(small_board.complete_row?(:X)).to eq(false)

            small_board[[2, 2]] = :X
            expect(small_board.complete_row?(:X)).to eq(true)

            small_board[[1, 0]] = :O
            small_board[[1, 1]] = :X
            small_board[[1, 2]] = :X
            expect(small_board.complete_row?(:O)).to eq(false)

            expect(small_board.complete_row?(:X)).to eq(true)
        end
    end

    describe "#complete_col?(mark)" do
        it "should accept a mark as an arg" do
            expect { small_board.complete_col?(:X) }.to_not raise_error
        end

        it "should return a boolean indicating if any col of the grid is completely filled with the mark" do
            expect(small_board.complete_col?(:X)).to eq(false)

            small_board[[0, 2]] = :X
            small_board[[1, 2]] = :X
            expect(small_board.complete_col?(:X)).to eq(false)

            small_board[[2, 2]] = :X
            expect(small_board.complete_col?(:X)).to eq(true)

            small_board[[0, 1]] = :O
            small_board[[1, 1]] = :X
            small_board[[2, 1]] = :X
            expect(small_board.complete_col?(:O)).to eq(false)

            expect(small_board.complete_col?(:X)).to eq(true)
        end
    end

    describe "#complete_diag?(mark)" do
        it "should accept a mark as an arg" do
            expect { small_board.complete_diag?(:X) }.to_not raise_error
        end

        it "should return a boolean indicating if either diagonal of the grid is completely filled with the mark" do
            # expect(small_board.complete_diag?(:X)).to eq(false)
            # expect(small_board.complete_diag?(:O)).to eq(false)

            # small_board[[0, 0]] = :X
            # expect(small_board.complete_diag?(:X)).to eq(false)
            # expect(small_board.complete_diag?(:O)).to eq(false)

            # small_board[[1, 1]] = :X
            # small_board[[2, 2]] = :X
            # expect(small_board.complete_diag?(:X)).to eq(true)
            # expect(small_board.complete_diag?(:O)).to eq(false)

            small_board[[0, 2]] = :O
            small_board[[1, 1]] = :O
            small_board[[2, 0]] = :O
            expect(small_board.complete_diag?(:O)).to eq(true)
        end
    end

    describe "#winner?(mark)" do
        it "should accept a mark as an arg" do
            expect { small_board.winner?(:X) }.to_not raise_error
        end

        it "should call the #complete_row?, #complete_col?, #complete_diag? methods" do
            expect(big_board).to receive(:complete_row?).at_least(:once)
            expect(big_board).to receive(:complete_col?).at_least(:once)
            expect(big_board).to receive(:complete_diag?).at_least(:once)

            big_board.winner?(:X)
        end


        context "when the given mark has not completely filled any row, col, or diagonal of the grid" do
            it "should return false" do
                big_board[[0, 0]] = :O
                expect(big_board.winner?(:O)).to eq(false)
            end
        end

        context "when the given mark has completely filled any row, col, or diagonal of the grid" do
            it "should return true" do
                big_board.instance_variable_get(:@grid)[3] = Array.new(10, :O)
                expect(big_board.winner?(:O)).to eq(true)

                small_board[[0, 0]] = :X
                small_board[[1, 1]] = :X
                small_board[[2, 2]] = :X
                expect(small_board.winner?(:X)).to eq(true)
            end
        end
    end
end
