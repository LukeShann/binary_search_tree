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
      find(value, node.left)
    end
  end

  def delete(value, node = @root)
    # Deal with root case
    # Find parent of node to be deleted
    # If is a leaf
      # Delete pointer to node
    # If has one child
      # Change parent's pointer to deleted node's child
    # If has two children
      # Fuck.
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end