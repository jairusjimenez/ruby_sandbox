require './board'

rematch = true
while rematch do
  board = Board.new
  gameover = false
  
  until gameover do
    board.ask_to_draw
    input = gets.chomp.to_i
    unless (1..9).include? input
      puts "'#{input}' is not a valid value!"
      next
    end
    draw_fail = board.try_to_draw(input)
    next if draw_fail
    board.display
    gameover = board.gameover?
  end
  
  if gameover == "tie"
    puts "The match is a draw!"
  else
    puts "'#{gameover}' wins the game!"
  end
  
  input = nil
  until ["y", "n"].include?(input)
    print "Start another match?[Y/N]"
    input = gets.chomp.downcase
  end

  rematch = case input
            when "y"
              true
            when "n"
              false
            end
end