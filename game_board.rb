require_relative 'knight.rb'

class GameBoard < Knight
  attr_accessor :first_move, :moves, :last_move, :paths, :made_moves, :shortest_path

  def initialize(first_move, last_move)
    @first_move = first_move
    @moves = Knight.new(first_move)
    @paths = [first_move]
    @made_moves = []
    @last_move = last_move
    @shortest_path = [first_move, last_move]
  end

  def possible_moves(coordinate)
    possible_moves =
      [coordinate[0] + 1, coordinate[1] + 2],
      [coordinate[0] + 1, coordinate[1] - 2],
      [coordinate[0] - 1, coordinate[1] - 2],
      [coordinate[0] - 1, coordinate[1] + 2],
      [coordinate[0] - 2, coordinate[1] - 1],
      [coordinate[0] - 2, coordinate[1] + 1],
      [coordinate[0] + 2, coordinate[1] + 1],
      [coordinate[0] + 2, coordinate[1] - 1]
    filter(possible_moves, made_moves.push(coordinate))
  end

  def filter(set1, set2 , arr = [])
    set1.each do |i|
      if (i[0].between?(1,8) && i[1].between?(1,8)) && (!paths.include? i)
        i == last_move ? arr.insert(0, i) : arr << i
      end
    end
    arr - set2
  end

  def travail
    current = paths.shift
    paths.push(*possible_moves(current)).each do |move|
      temp = moves
      temp = temp.next_move until temp.next_move.nil?
      temp.next_move = Knight.new(move, current)
      return temp.next_move.prev_move if move == last_move
    end
    travail
  end

  def display(root, count = 1)
    if root.nil? || moves.next_move.data == last_move || root == first_move
      return result(count)
    else
      shortest_path.insert(1, root)
      count += 1
      temp = moves
      temp = temp.next_move until temp.next_move.data == root
      display(temp.prev_move, count)
    end
  end

  def result(count)
    display = "You made it in #{count} "\
              "#{count == 1 ? 'move' : 'moves'}! "\
              "Here's your path:"
    display += "\n#{shortest_path.shift}" until shortest_path.length == 0
    puts display
  end
end
