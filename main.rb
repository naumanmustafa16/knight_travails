require_relative 'graph'

def knight_moves(starting_square, ending_square)
  moves = -1

  shrotest_path = []
  graph = Graph.new(starting_square, ending_square).build_graph

# p graph

current_square = graph[-1]

  until current_square.nil?
    shrotest_path.unshift(current_square.value)
    moves += 1

    current_square = current_square.last_move
  end

  puts " Congratualtions. You made it in #{moves} moves!
  Here is your path:"
  shrotest_path.each do |move|
    p move
  end
end

knight_moves([0,0], [1,0])
