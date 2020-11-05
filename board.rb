class Board
  attr_accessor :starting_square, :ending_square

  def initialize(starting_square, ending_square)
    @starting_square = starting_square
    @ending_square = ending_square
  end

  def possible_moves(coordinate)
    move =
      [coordinate[0] + 2, coordinate[1] - 1],
      [coordinate[0] + 2, coordinate[1] + 1],
      [coordinate[0] - 2, coordinate[1] - 1],
      [coordinate[0] - 2, coordinate[1] + 1],
      [coordinate[0] + 1, coordinate[1] - 2],
      [coordinate[0] + 1, coordinate[1] + 2],
      [coordinate[0] - 1, coordinate[1] - 2],
      [coordinate[0] - 1, coordinate[1] + 2]
  end
end