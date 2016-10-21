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

  opts.on("-s", "--seed SEED", "Use a specific seed") do |v|
    options[:seed] = v.to_i
  end

  opts.on("-o", "--output FILE", "Output result to a PNG file") do |v|
    options[:output] = v
  end
end.parse!

seed = options[:seed] || Random.new_seed
srand(seed)

grid = Grid.new(18, 18)

case options[:algorithm]
when 'sidewinder'
  Sidewinder.on(grid)
when 'binary_tree'
  BinaryTree.on(grid)
else
  raise ArgumentError, "Invalid algorithm"
end

puts "Generated with seed #{seed}"

if (options[:output])
  grid.to_png.save options[:output]
  puts "Saved PNG to #{options[:output]}"
else
  puts grid
end



