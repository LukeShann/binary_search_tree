class Tree
  attr_accessor :root
  def initialize(arr)
    @root = build_tree(arr.sort.uniq)
  end

  def build_tree(arr)
    if arr.length <= 2
      root = arr.pop
      left = arr.empty? ? nil : Node.new(arr.pop)
      return Node.new(root, left)
    end
    mid = arr.length / 2
    left = arr[0..mid - 1]
    right =  arr[mid + 1..-1]
    Node.new(arr[mid], build_tree(left), build_tree(right))
  end

  def insert(value, node = @root)
    case value <=> node.data
    when -1
      if node.left_node.nil?
        node.left_node = Node.new(value)
        return
      else
        insert(value, node.left_node)
      end
    when 0
      puts 'ERROR: Duplicate value'
      return
    when 1
      if node.right_node.nil?
        node.right_node = Node.new(value)
        return
      else
        insert(value, node.right_node)
      end
    end
  end

  def delete(value)
  end

end