class Sidewinder
  def self.on(grid)
    run = []

    grid.each_cell do |cell|
      neighbours = []
      neighbours << cell.north if cell.north
      neighbours << cell.east if cell.east

      index = rand(neighbours.length)
      neighbour = neighbours[index]

      case index
      when 0 # north
        target = run.sample || cell
        target.link(target.north) if target.north

        run = []
      when 1 # east
        if neighbour
          cell.link(neighbour)
          run << neighbour
        end
      end
    end
  end
end
