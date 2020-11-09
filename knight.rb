class Knight
  attr_accessor :data, :prev_move, :next_move

  def initialize(data = nil, prev_move = nil, next_move = nil)
    @data = data
    @prev_move = prev_move
    @next_move = next_move
  end
end
