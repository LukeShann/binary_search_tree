class Node
  include Comparable
  attr_accessor :data, :left_node, :right_node

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left_node = left
    @right_node = right
  end

  def <=>(other)
    @data <=> other.data
  end
end