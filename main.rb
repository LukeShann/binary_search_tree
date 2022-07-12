require_relative 'lib/tree'
require_relative 'lib/node'

tree = Tree.new([1, 2, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 6, 10])
tree.pretty_print
p tree.postorder
p tree.depth(7)
p tree.depth(4)
p tree.depth(6)
p tree.depth(5)