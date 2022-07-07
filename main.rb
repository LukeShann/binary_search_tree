require_relative 'lib/tree'
require_relative 'lib/node'

one = Node.new(1)
two = Node.new(2)
three = Node.new(3)

puts one < three
puts three < two