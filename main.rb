require_relative 'lib/tree'
require_relative 'lib/node'

tree = Tree.new(Array.new(15) { rand(1..100) })
tree.pretty_print
puts tree.balanced?
p tree.level_order
p tree.preorder
p tree.postorder
p tree.inorder
tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)
puts tree.balanced?
tree.rebalance
puts tree.balanced?
p tree.level_order
p tree.preorder
p tree.postorder
p tree.inorder
