require_relative 'knight.rb'

def knight_moves(start, finish)
  knight = Knight.new(start, finish)
  p knight.travail
end

knight_moves([3,3],[4,3])