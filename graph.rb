require_relative "node"

class Graph
  
  attr_accessor :starting_square, :ending_square
  def initialize(starting_square, ending_square)
    @starting_square = starting_square
    @ending_square = ending_square
  end

  def possible_moves(square)
    
    moves = 
    [
      [square.value[0] + 1, square.value[1] + 2],
      [square.value[0] + 2, square.value[1] + 1],
      [square.value[0] + 2, square.value[1] - 1],
      [square.value[0] + 1, square.value[1] - 2],
      [square.value[0] - 1, square.value[1] - 2],
      [square.value[0] - 2, square.value[1] - 1],
      [square.value[0] - 1, square.value[1] + 1],
      [square.value[0] - 1, square.value[1] + 2],
]

moves.filter! do |move|
  move != square.value && (move[0] >= 0 && move[0] <= 7 && move[1] >= 0 && move[1] <= 7)
end

moves.map do |move|
  Node.new(move, square)
end
  end

  def build_graph
    queue = []
    ordered_nodes = []

    queue << Node.new(starting_square)

    until queue.empty?
      current = queue[0]
      ordered_nodes << current
      break if current.value == ending_square

      possible_moves = possible_moves(current)
      queue += possible_moves
      queue.shift
    end
    ordered_nodes
  end
end