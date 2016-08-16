def caesar_cipher(user_text, shift_factor)
	print "Caesar Cipher: "
	my_array = user_text.split(" ")
	my_array.each do |x|
		my_word = ""
		x.each_char do |y|
			temp_word = ""
			if /[[:upper:]]/.match(y)
				if y.ord + shift_factor > 90
					temp_word = (y.ord + shift_factor - 90) + 64
					my_word << temp_word.chr
				else
					temp_word = y.ord + shift_factor
					my_word << temp_word.chr
				end
			else
				if y.ord + shift_factor > 122
					temp_word = (y.ord + shift_factor - 122) + 96
					my_word << temp_word
				else
					temp_word = y.ord + shift_factor
					my_word << temp_word.chr
				end
			end
		end
		print my_word + " "
	end
end

print "Enter a sentence: "
user_sentence = gets.chomp
print "Enter the shift factor: "
user_number = gets.chomp.to_i

caesar_cipher(user_sentence, user_number)