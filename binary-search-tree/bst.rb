require './node.rb'

def build_tree(array)
	n = array.size
	parent = Node.new(array[n/2])
	array.delete_at(n/2)
	until array.size == 0
		n = array.size
		child = Node.new(array[n/2])
		array.delete_at(n/2)
		parent.child_assign(child)
	end
	parent
end

def dfs_rec(node, target_value)
	return node if node.value == target_value
	dfs_rec(node.left_child, target_value) if node.left_child
	dfs_rec(node.right_child, target_value) if node.right_child
end

tree = build_tree([1,4,6,7,2,4,9,11])

puts "#{tree.inspect} \n\n"
puts "#{tree.breadth_first_search(11)} \n\n"
puts "#{tree.breadth_first_search(12).inspect} \n\n" 
puts "#{tree.depth_first_search(11)} \n\n" 
puts "#{tree.depth_first_search(12).inspect} \n\n"
puts "#{dfs_rec(tree, 11)} \n\n"
puts "#{dfs_rec(tree, 12).inspect} \n\n"