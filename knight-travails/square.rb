class Square
	attr_reader :pos_x, :pos_y, :parent_node, :children
	def initialize(pos_x, pos_y, parent_node = nil)
		@pos_x = pos_x
		@pos_y = pos_y
		@parent_node = parent_node
		@children = []
	end

	def possible_paths
		possible = []
		possible = get_codes
		right_ones = possible.select { |aux| aux[0].between?(0,7) && aux[1].between?(0,7)}
		@children = right_ones.map { |aux| Square.new(aux[0], aux[1], self) }
	end

	def get_codes
		hash = { 1 => [2,-2], 2 => [1,-1], -1 => [2,-2], -2 => [1, -1]}
		ret_res = []
		hash.each do |key,y_y|
			ret_res << [@pos_x + key, @pos_y + y_y[0]]
			ret_res << [@pos_x + key, @pos_y + y_y[1]]
		end
		return ret_res
	end
end