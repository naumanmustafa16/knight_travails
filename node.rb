class Node
  attr_accessor :value, :last_move, :possible_moves
  
  def initialize(value, last_move=nil)
    @value = value
    @last_move = last_move
    @possible_moves = nil
  end
end