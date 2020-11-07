require_relative 'node.rb'

class Knight < Node
  attr_accessor :start, :path, :finish, :paths, :visited

  def initialize(start, finish)
    @start = start
    @path = Node.new(start)
    @finish = finish
    @paths = [start]
    @visited = []
  end

  def possible_moves(coordinate, used_moves)
    possible_moves =
      [coordinate[0] + 1, coordinate[1] + 2],
      [coordinate[0] + 1, coordinate[1] - 2],
      [coordinate[0] - 1, coordinate[1] - 2],
      [coordinate[0] - 1, coordinate[1] + 2],
      [coordinate[0] - 2, coordinate[1] - 1],
      [coordinate[0] - 2, coordinate[1] + 1],
      [coordinate[0] + 2, coordinate[1] + 1],
      [coordinate[0] + 2, coordinate[1] - 1]
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
      return temp.next_move.previous_move if move == finish
    end
    travail
  end

  def show(root, count = 1, arr = [start, finish])
    return puts message(count, arr) if root.nil?
    arr.insert(1, root)
    count += 1
    temp = path
    temp = temp.next_move until temp.next_move.move == root
    show(temp.previous_move, count, arr)
  end

  def message(count, arr)
    display = "You made it in #{count} moves!  Here's your path:"
    display += "\n#{arr.shift}" until arr.length == 0
    display
  end
end