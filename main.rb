require_relative 'lib/tree'
require_relative 'lib/node'

tree = Tree.new([1, 2, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 6, 10, 12, 78, 1231])

p tree.balanced?

tree.insert(100)
tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)

tree.pretty_print
p tree.balanced?
tree.rebalance
tree.pretty_print
p tree.balanced?