$LOAD_PATH.unshift('.')
# djikstra algorithm to solve mazes
# let's try using chunky png to print out the numbers!
require 'byebug'
require 'grid'
require 'binary_tree'

srand(123)

grid = Grid.new(10, 10)
BinaryTree.on(grid)

def measure_frontier(current_cell)
  current_cell.links.each do |c|
    next unless c.distance == nil
    c.distance = current_cell.distance + 1
    measure_frontier(c) if c.links.count > 0
  end
end

starting_cell = grid[0, 0]
starting_cell.distance = 0
measure_frontier(starting_cell)


puts grid.to_s(debug_display: :distance)
