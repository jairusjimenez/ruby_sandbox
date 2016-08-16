def stock_picker (stock_prices)
	buy, sell, max_price = 0,0,0
	my_array = stock_prices.split(",").collect { |x| x.to_i}
	my_array.each do |x|
		my_array[0..-1].each do |y|
			if (x - y) > max_price
				max_price = x - y
				buy = x
				sell = y
			end
		end
	end
	puts "[#{buy}, #{sell}] Best Price: #{max_price}"
end

puts "Enter stock prices, one for each hypothetical day, seperated by commas:"
user_input = gets.chomp
stock_picker(user_input)