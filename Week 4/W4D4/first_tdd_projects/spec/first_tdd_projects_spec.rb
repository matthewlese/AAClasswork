require 'rspec'
require 'spec_helper'
require 'first_tdd_projects'

describe "remove_dups" do

  it "should accept an array as argument" do
    expect { remove_dups([1,1,2,3]) }.to_not raise_error
  end

  it "should return a new array with duplicate elements removed" do
    expect( remove_dups([1,1,2,3]) ).to eq([1,2,3])
    expect( remove_dups([2,2]) ).to eq([2])
    expect( remove_dups([1,2,3]) ).to eq([1,2,3])
    expect( remove_dups(["cat", "cat", "dog"]) ).to eq(["cat","dog"])
  end

end

describe "two_sum" do

  it "should accept an array as argument" do
    expect { two_sum([-1, 0, 2, -2, 1]) }.to_not raise_error
  end

  it "should return pairs of negating elements' indices, sorted" do
    expect( two_sum([-1, 0, 2, -2, 1]) ).to eq([[0, 4], [2, 3]])
    expect( two_sum([1,1,2,3]) ).to eq([])
    expect( two_sum([]) ).to eq([])
  end

end

describe "my_transpose" do

  let(:rows) do
     [ [0, 1, 2],
       [3, 4, 5],
       [6, 7, 8] ]
  end

  let(:cols) do
    [ [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8] ]
  end

  it "should accept an matrix as argument" do
    expect { my_transpose(rows) }.to_not raise_error
  end

  it "should return the argument matrix transposed" do
    expect( my_transpose(rows) ).to eq(cols)
  end

end

