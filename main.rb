require_relative 'game_board.rb'

def knight_moves(start, finish)
  knight = GameBoard.new(start, finish)
  path = knight.travail
  knight.display(path)
end

knight_moves([3,3],[4,3])
