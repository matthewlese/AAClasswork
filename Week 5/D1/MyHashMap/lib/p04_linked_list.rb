class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.

    @prev.next = @next
    @next.prev = @prev
  end

  def inspect
    "key:#{@key}, val:#{@val}, next:#{@next}, prev:#{@prev}"
  end
end

class LinkedList
include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    curr_node = @head
    until curr_node == @tail
      return curr_node.val if curr_node.key == key
      curr_node = curr_node.next
    end
    nil
  end

  def include?(key)
    each { |node| return true if node.key == key }
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = last
    last.next = new_node
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    curr_node = @head
    until curr_node == @tail
      if curr_node.key == key
        curr_node.val = val
        break
      end
      curr_node = curr_node.next
    end
    nil
  end

  def remove(key)
    curr_node = @head
    until curr_node == @tail
      if curr_node.key == key
        curr_node.remove
        break
      end
      curr_node = curr_node.next
    end
    nil
  end

  def each(&prc)
    curr_node = @head.next
    until curr_node == @tail
      prc.call(curr_node)
      curr_node = curr_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
