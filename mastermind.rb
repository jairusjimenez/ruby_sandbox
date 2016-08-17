class Mastermind

	COLORS = [:R,:O,:Y,:G,:B,:P]

	def initialize
		puts "\nWelcome to Mastermind!\n"

		codemaker_brain = choose_brain("codemaker")

		codebreaker_brain = choose_brain("codebreaker")

		if codemaker_brain == :computer
			@secret_code = computer_random_code
		elsif codemaker_brain == :human
			@secret_code = human_secret_code
		end

		if codemaker_brain == :human && codebreaker_brain == :human
			puts "\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\
			\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v"
		end

		if codebreaker_brain == :human
			human_rounds
		elsif codebreaker_brain == :computer
			@guess_array = []
			@final_guess = []
			computer_rounds
		end

		play_again
				
	end

	def choose_brain(player_role)
		puts "\nIs the #{player_role} a 'human' or the 'computer'?"
		brain = gets.chomp.strip.downcase.to_sym
		until brain == :human || brain == :computer
			invalid_input
			puts "\nIs the #{player_role} a 'human' or the 'computer'?"
			brain = gets.chomp.strip.downcase.to_sym
		end
		brain
	end

	def human_code_input
		code_string = gets.chomp.strip.upcase
		if code_string.size != 4 || code_string.index(/[^ROYGBP]/)
			invalid_input
			human_code_input
		else
			code = code_string.split(//).map {|color| color.to_sym}
		end
	end

	def computer_random_code
		code = []
		4.times do
			code.push(COLORS[rand(6)])
		end
		code
	end

	def computer_random_guess
		guess = computer_random_code
		if @guess_array.include?(guess)
			computer_random_guess
		else
			@guess_array.push(guess)
			guess
		end
	end

	def computer_smart_guess(i=0)
		guess = []
		unless @final_guess.size == 4
			while guess.size < 4
				guess.push(COLORS[i])
			end
			correct_colors = correct_color_correct_position(guess)
			if correct_colors > 0
				correct_colors.times do
					@final_guess.push(COLORS[i])
				end
			end
			@guess_array.push(guess)
			guess
		else
			while @guess_array.include?(@final_guess)
				@final_guess = @final_guess.shuffle
			end
			@guess_array.push(@final_guess)
			@final_guess
		end
	end

	def correct_color_correct_position(guess)
		i = 0
		num = 0
		4.times do
			if guess[i] == @secret_code[i]
				num += 1
			end
			i += 1
		end
		num
	end

	def round_feedback(guesser,guess,tries)
		puts "\nGuess ##{tries}: #{guesser.capitalize} guessed #{guess.join}"
		KeyPeg.new(guess,@secret_code).feedback unless guess == @secret_code
	end

	def human_rounds
		tries = 0
		guess = []
		human_guess_directions
		until guess == @secret_code || tries == 12
			puts "\nYour guess:"
			guess = human_code_input
			tries += 1
			round_feedback("you",guess,tries)
		end
		puts guess == @secret_code ? "This is CORRECT! It took #{tries} tries." \
		: "\nFailure! You didn't guess in the first 12 tries."
	end

	def computer_rounds
		tries = 0
		guess = []
		until guess == @secret_code
			guess = computer_smart_guess(tries)
			tries += 1
			round_feedback("computer",guess,tries)
		end
		puts "This is CORRECT! It took #{tries} tries."
	end

	def human_guess_directions
		puts "\nCodebreaker, using the first letter of the"
		puts "following six colors, guess the secret code"
		puts "made up of four of these colors (duplicates"
		puts "of a color are allowed): Red ('R'),"
		puts "Orange ('O'), Yellow ('Y'), Green ('G'),"
		puts "Blue ('B'), Purple ('P'). For example, if"
		puts "your code sequence is Red Yellow Red Green,"
		puts "type RYRG with no spaces or punctuation."
		puts "You have 12 guesses."
	end

	def human_secret_code
		human_secret_code_directions
		puts "\nYour secret code:"
		secret_code = human_code_input
		puts "Your secret code is #{secret_code.join}"
		secret_code
	end

	def human_secret_code_directions
		puts "\nCodemaker, using the first letter of the"
		puts "following six colors, create a secret code"
		puts "made up of four of these colors (duplicates"
		puts "of a color are allowed): Red ('R'),"
		puts "Orange ('O'), Yellow ('Y'), Green ('G'),"
		puts "Blue ('B'), Purple ('P'). For example, if"
		puts "your code sequence is Red Yellow Red Green,"
		puts "type RYRG with no spaces or punctuation."
	end

	def play_again
		puts "\nPlay again ('yes' or 'no')?"
		response = gets.chomp.strip.downcase
		if response == "yes"
			initialize
		elsif response == "no"
			puts "\nGoodbye!\n\n"
		else
			invalid_input
			play_again
		end				
	end

	def invalid_input
		puts "\nInvalid input. Try again.\n"
	end

end

class KeyPeg

	def initialize(guess, secret)
		@guess = guess
		@secret = secret
	end

	def correct_color_correct_position
		i = 0
		num = 0
		4.times do
			if @guess[i] == @secret[i]
				num += 1
				@guess[i] = @guess[i].to_s
				@secret[i] = @secret[i].to_s
			end
			i += 1
		end
		num
	end

	def correct_color_wrong_position
		i = 0
		j = 0
		num = 0
		@guess.each do |guess_color|
			if guess_color.is_a?(Symbol)
				@secret.each do |secret_color|
					if guess_color == secret_color
						num += 1
						@guess[i] = @guess[i].to_s
						@secret[j] = @secret[j].to_s
					end
					j += 1
				end
			end
			i += 1
			j = 0
		end
		@guess.map! {|color| color.to_sym}
		@secret.map! {|color| color.to_sym}
		num
	end

	def feedback
		if correct_color_correct_position == 1 && correct_color_wrong_position == 1
			puts "You have #{correct_color_correct_position} color that is correct and"
			puts "in the correct position and #{correct_color_wrong_position} color"
			puts "that is correct but in the wrong position."
		elsif correct_color_correct_position == 1
			puts "You have #{correct_color_correct_position} color that is correct and"
			puts "in the correct position and #{correct_color_wrong_position} colors"
			puts "that are correct but in the wrong position."
		elsif correct_color_wrong_position == 1
			puts "You have #{correct_color_correct_position} colors that are correct and"
			puts "in the correct position and #{correct_color_wrong_position} color"
			puts "that is correct but in the wrong position."
		else
			puts "You have #{correct_color_correct_position} colors that are correct and"
			puts "in the correct position and #{correct_color_wrong_position} colors"
			puts "that are correct but in the wrong position."
		end	
	end

end

new_game = Mastermind.new
