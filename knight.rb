require_relative 'node.rb'

class Knight < Node
  attr_accessor :path, :path_queues, :finish

  def initialize(start, finish)
    @path = Node.new(start)
    @path_queues = [start]
    @finish = finish
  end

  def possible_moves(coordinate)
    pos_moves =
      [coordinate[0] + 2, coordinate[1] - 1],
      [coordinate[0] + 2, coordinate[1] + 1],
      [coordinate[0] - 2, coordinate[1] - 1],
      [coordinate[0] - 2, coordinate[1] + 1],
      [coordinate[0] + 1, coordinate[1] - 2],
      [coordinate[0] + 1, coordinate[1] + 2],
      [coordinate[0] - 1, coordinate[1] - 2],
      [coordinate[0] - 1, coordinate[1] + 2]
    pos_moves.each { |move| path_queues << move if move[0].between?(1,8) && move[1].between?(1,8) }
  end

  def travail(visited = [], current = path_queues.shift)
    visited << current
    possible_moves(current)
    path_queues.each do |move|
      temp = path
      temp = temp.next_move until temp.next_move.nil?
      temp.next_move = Node.new(move, current)
      return path if move == finish
    end
    @path_queues -= visited
    travail(visited)
  end
end