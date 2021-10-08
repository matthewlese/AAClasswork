require_relative 'PolyTreeNode'
require 'byebug'

class KnightPathFinder

  attr_reader :considered_positions, :board, :start_pos, :root_node

  MOVES = [
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2],
    [2, 1],
    [2, - 1],
    [-2, -1],
    [-2, 1]
  ]

  def self.valid_moves(pos)
    valid_moves = []
    
    MOVES.each do |move| 
      new_pos = [move[0] + pos[0], move[1] + pos[1]]
      if new_pos.none? { |ele| ele > 7 || ele < 0 }
        valid_moves << new_pos 
      end
    end
    valid_moves
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @considered_positions = [start_pos]
    #board = Array.new(8) { Array.new(8, "_") }
    self.build_move_tree
  end

  def build_move_tree
    start = self.new_move_positions(self.start_pos)
    queue = start

    until queue.empty?
      current = queue.shift 
      new_inst = PolyTreeNode.new(current)
      valids = self.new_move_positions(current)
      if !valids.nil?
        new_inst.add_children(valids)
        new_inst.children.each { |child| queue << child }
      else
        break
      end
    end
    @considered_positions
  end

  def new_move_positions(position)
    possible_moves = KnightPathFinder.valid_moves(position)
    possible_moves.select do |el|
       !@considered_positions.include?(el)
    end
    return nil if possible_moves.empty?
    @considered_positions += possible_moves
    possible_moves   
  end
       

end

test = KnightPathFinder.new([0,0])

p test.considered_positions