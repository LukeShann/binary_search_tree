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
      if node.left.nil?
        node.left = Node.new(value)
        return
      else
        insert(value, node.left)
      end
    when 0
      puts 'ERROR: Duplicate value'
      return
    when 1
      if node.right.nil?
        node.right = Node.new(value)
        return
      else
        insert(value, node.right)
      end
    end
  end

  def find(value, node = @root)
    case value <=> node.data
    when -1
      return 'No node found' if node.left.nil?
      find(value, node.left)
    when 0
      return node
    when 1
      return 'No node found' if node.right.nil?
      find(value, node.right)
    end
  end

  def delete(value)
    @root = delete_recursive(value, @root)
  end 

  def delete_recursive(value, node)
    # Handle empty tree
    return node if node.nil?

    # Navigate tree
    case value <=> node.data
    when -1
      node.left = delete(value, node.left)
    when 1
      node.right = delete(value, node.right)
    when 0
      # When this is the node to be deleted
      # Check for 3 cases
      if node.right.nil? && node.left.nil?
        return nil
      elsif node.right.nil?
        return node.left
      elsif node.left.nil?
        return node.right
      else
        # Find min value
      end
    end
    return node
  end

  def find_min_value(node)
    return node.data if node.left.nil?
    find_min_value(node.left)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end