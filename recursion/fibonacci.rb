def fibs( num )
	return 0 if num == 0
	return 1 if num == 1
	fibs(num - 1) + fibs(num - 2)

end

def fibs_rec( num )
	num < 2 ? num : fibs_rec(num-1) + fibs_rec(num-2)
end

puts "Enter number(1-n): "
user_input = gets.chomp.to_i
puts fibs_rec(user_input)