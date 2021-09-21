class PolyTreeNode

  attr_reader :parent, :value
  attr_accessor :children
  
  def initialize(start)
    @start = start 
    @parent = nil
    @children = []
  end

  def parent=(parent_node) 
    prev_parent = self.parent
    @parent = parent_node
    return nil if parent == nil
    if prev_parent == nil
      if !parent_node.children.include?(self)
        parent_node.children << self   
      end   
    else #current node has a previous parent
      prev_parent.children.delete(self)
      parent_node.children << self   
    end
  end

  def add_children(children_arr)
    # node.parent = self if node.parent.nil?
    self.children += children_arr
  end

  def remove_child(node)
    raise "Node is not a child" if node.parent == nil
    node.parent = nil
  end

  def dfs(value)
    return self if self.value == value
    return nil if self.children.nil? 
    self.children.each do |child|
        new_search = child.dfs(value)
        return new_search if !new_search.nil?

        # current_node = stack.last
        # current_node.children.each { |child| stack.push(child) }
        # (stack.pop).dfs(value)
    end
    nil
  end

  def bfs(value)

    queue = []
    queue.unshift(self)

    until queue.empty?
        current_node = queue.shift 
        return current_node if current_node.value == value 
        current_node.children.each { |child| queue.push(child) } 
    end
    nil
  end 

end