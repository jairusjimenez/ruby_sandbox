require './node.rb'

class LinkedList
	attr_accessor :size, :head, :tail
	def initialize
		@head = Node.new("head", nil)
	end

	def append(value)
		tail.next_node = Node.new(value, nil)
	end

	def prepend(value)
		@head.next_node = Node.new(value, @head.next_node)
	end

	def size
		if @head.next_node
			node = @head.next_node
			i = 1
			while node.next_node
				node = node.next_node
				i += 1
			end
			return i
		else
			return 0
		end
	end

	def head
		@head
	end

	def tail
		if @head.next_node
			node = @head.next_node
			while node.next_node
				node = node.next_node
			end
			node
		else
			@head
		end
	end

	def at(index)
		if size > index
			if @head.next_node
				node = @head.next_node
				i = 0
				until i == index
					node = node.next_node
					i += 1
				end
			end
			return node
		else
			return nil
		end
	end

	def pop
		if @head.next_node
			node = @head.next_node
			while node.next_node.next_node
				node = node.next_node
			end
			popping = node.next_node
			node.next_node = nil
			return popping
		else
			return nil
		end

	end

	def contains?(value)
		if @head.next_node
			node = @head.next_node
			while node.next_node
				if node.value == value
					return true
				else
					node.next_node
				end
			end
			return false
		else
			return false
		end
	end

	def find(value)
		if @head.next_node
			node = @head.next_node
			i = 0
			while node.next_node
				if node.value == value
					return i
				else
					node = node.next_node
					i += 1
				end
			end
			return nil
		else
			return nil
		end
	end

	def to_s
		if @head.next_node
			s = "(#{@head.next_node.value}) =>"
			node = @head.next_node
			while node.next_node
				s += "(#{node.next_node.value}) =>"
				node = node.next_node
			end
			return s
		else
			return "nil"	
		end
	end

	def insert_at(index, value)
		at(index-1).next_node = Node.new(value, at(index-1).next_node)
	end

	def remove_at(index)
		at(index-1).next_node = at(index).next_node
	end
end