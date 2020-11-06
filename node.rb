class Node
  attr_accessor :move, :previous_move, :next_move

  def initialize(move = nil, previous_move = nil, next_move = nil)
    @move = move
    @previous_move = previous_move
    @next_move = next_move
  end

end