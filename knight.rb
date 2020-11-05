require_relative 'board.rb'

class Knight < Board
  attr_accessor :path, :start, :finish

  def initialize(start, finish)
    @path = Board.new(start, finish)
    @start = path.starting_square
    @finish = path.ending_square
  end

  def travail
    p possible_moves(finish)
  end
end