class Tree
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

  def delete_recursive(value, node = @root)
    return node if node.nil?
    case value <=> node.data
    when -1
      node.left = delete_recursive(value, node.left)
    when 1
      node.right = delete_recursive(value, node.right)
    when 0
      if node.right.nil? && node.left.nil?
        return nil
      elsif node.right.nil?
        return node.left
      elsif node.left.nil?
        return node.right
      else
        node.data = find_min_child(node.right)
        node.right = delete_recursive(node.data, node.right)
      end
    end
    return node
  end

  def find_min_child(node)
    return node.data if node.left.nil?
    find_min_child(node.left)
  end

  def level_order(que = [@root], arr = [], &block)
    return arr if que.empty?
    que.push(que.first.left) if que.first.left
    que.push(que.first.right) if que.first.right
    if block_given?
      yield(que.shift)
      level_order(que, &block)
    else
      arr.push(que.shift.data)
      level_order(que, arr)
    end
  end

  def preorder(node = @root, arr = [], &block)
    yield node if block_given?
    arr.push(node.data)
    arr = preorder(node.left, arr, &block) if node.left
    arr = preorder(node.right, arr, &block) if node.right
    arr
  end

  def inorder(node = @root, arr = [], &block)
    arr = inorder(node.left, arr, &block) if node.left
    yield node if block_given?
    arr.push node.data
    arr = inorder(node.right, arr, &block) if node.right
    arr
  end

  def postorder(node = @root, arr = [], &block)
    arr = postorder(node.left, arr, &block) if node.left
    arr = postorder(node.right, arr, &block) if node.right
    yield node if block_given?
    arr.push(node.data)
    arr
  end

  def depth(value, node = @root, d = 0)
    case value <=> node.data
    when -1
      return 'No node found' if node.left.nil?
      depth(value, node.left, d + 1)
    when 0
      return d
    when 1
      return 'No node found' if node.right.nil?
      depth(value, node.right, d + 1)
    end
  end

  def height(value)
    tree_depth - depth(value)
  end

  def tree_depth(que = [@root, 0], depth = 0, deepest = 0)
    return deepest if que.empty?
    que.push(que.first.left, depth + 1) if que.first.left
    que.push(que.first.right, depth + 1) if que.first.right
    deepest = que[1] if que[1] > deepest
    que.shift(2)
    tree_depth(que, que[1], deepest)
  end

  def balanced?(node = @root)
    return true if node.nil?
    left_dep = node.left ? tree_depth([node.left, 0]) : 0
    right_dep = node.right ? tree_depth([node.right, 0]) : 0
    if (left_dep - right_dep).abs <= 1
      return balanced?(node.left) & balanced?(node.right)
    end
    false
  end

  def rebalance
    @root = build_tree(preorder)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '???   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '????????? ' : '????????? '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '???   '}", true) if node.left
  end

end