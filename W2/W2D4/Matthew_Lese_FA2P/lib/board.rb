class Board

	require "byebug"

	def self.build_stacks(num_stacks)
		Array.new(num_stacks){Array.new(0)}
	end

	# def [](index)
	# 	@stacks[index]
	# end

	# def []=(index, ele)
	# 	@stacks[index] = ele
	# end

	def initialize(new_num_stacks, max_height)
		@max_height = max_height
		if new_num_stacks >= 4 && max_height >= 4
			@stacks = Board.build_stacks(new_num_stacks)
		else
			raise "rows and cols must be >= 4"
			return
		end
	end

	attr_reader :max_height, :num_stacks

	def add(token, stack_index)
		if @stacks[stack_index].length < @max_height
			@stacks[stack_index].unshift(token)
			return true
		else
			return false
		end
	end

	def vertical_winner?(token)
		@stacks.any? do |stack|
			stack.count(token) == @max_height
		end
	end

	def horizontal_winner?(token)
		(0..@stacks.map(&:size).min).each do |i| #@stacks.map { |stack| stack.size }
			row = []
			@stacks.each { |stack| row << stack[i] }
			return true if row.all? { |ele| ele == token }
		end
		false
	end

	def winner?(token)
		self.vertical_winner?(token) || self.horizontal_winner?(token)
	end

	# This Board#print method is given for free and does not need to be modified
	# It is used to make your game playable.
	def print
			@stacks.each { |stack| p stack }
	end
end
