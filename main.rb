require_relative 'lib/tree'
require_relative 'lib/node'

tree = Tree.new([1, 2, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 6, 10])
tree.pretty_print
p tree.postorder