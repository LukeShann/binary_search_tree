require_relative 'lib/tree'
require_relative 'lib/node'

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345])
tree.insert(9999)
tree.insert(5555)
tree.insert(6666)
tree.insert(67)
p tree.root.right_node