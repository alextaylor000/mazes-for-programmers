require 'optparse'
require 'grid'
require 'binary_tree'
require 'sidewinder'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: demo.rb [options]"
  opts.on("-a", "--algorithm ALGORITHM", "Choose algorithm") do |v|
    options[:algorithm] = v
  end
end.parse!


grid = Grid.new(18, 18)

case options[:algorithm]
when 'sidewinder'
  Sidewinder.on(grid)
  puts grid
when 'binary_tree'
  BinaryTree.on(grid)
  puts grid
else
  raise ArgumentError, "Invalid algorithm"
end


