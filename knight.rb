require_relative 'node.rb'

class Knight < Node
  attr_accessor :path, :finish, :paths, :visited

  def initialize(start, finish)
    @path = Node.new(start)
    @finish = finish
    @paths = [start]
    @visited = []
  end

  def possible_moves(coordinate, used_moves)
    possible_moves =
      [coordinate[0] + 2, coordinate[1] - 1],
      [coordinate[0] + 2, coordinate[1] + 1],
      [coordinate[0] - 2, coordinate[1] - 1],
      [coordinate[0] - 2, coordinate[1] + 1],
      [coordinate[0] + 1, coordinate[1] - 2],
      [coordinate[0] + 1, coordinate[1] + 2],
      [coordinate[0] - 1, coordinate[1] - 2],
      [coordinate[0] - 1, coordinate[1] + 2]
    filter(possible_moves, used_moves)
  end

  def filter(set1, set2, arr = [])
    set1.each do |i|
      arr << i if i[0].between?(1,8) && i[1].between?(1,8)
    end
    arr - set2
  end

  def travail(current = paths.shift)
    paths.push(*possible_moves(current, visited << current))
    paths.each do |move|
      temp = path
      temp = temp.next_move until temp.next_move.nil?
      temp.next_move = Node.new(move, current)
      return path if move == finish
    end
    travail
  end
end