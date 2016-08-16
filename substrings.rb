def substrings(user_text, dict)
	my_array = user_text.split(" ")
	my_hash = Hash.new(0)
	my_array.each do |x|
		dict.each do |y|
				my_hash[y] += 1 if x =~ (/#{y}/)
		end
	end
	return my_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts "Enter text: "
user_sentence = gets.chomp
puts substrings(user_sentence, dictionary)