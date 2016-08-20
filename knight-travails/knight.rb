require './square.rb'

def get_general_tree(from, to)
	queue = []
	puts "From: #{from.pos_x} #{from.pos_y}"
	puts "To: #{to.pos_y} #{to.pos_x}"
	queue << from
	loop do
		tmp = queue.shift
		return tmp if tmp.pos_x == to.pos_x && tmp.pos_y == to.pos_y
		tmp.possible_paths.each { |child| queue << child}
	end
end

def knight_moves(root, destination)
	end_pos = Square.new(destination[0], destination[1])
	root_pos = Square.new(root[0], root[1])
	g_tree = get_general_tree(root_pos, end_pos)
	route = []
	route.unshift([end_pos.pos_x, end_pos.pos_y])
	current = g_tree.parent_node
	until current == nil
		route.unshift [current.pos_x, current.pos_y]
		current = current.parent_node
	end
	puts "Found it in #{route.length - 1} steps! Your path was: "
	route.each { |square| puts square.inspect}
	return nil
end

knight_moves([5,6], [2,7])