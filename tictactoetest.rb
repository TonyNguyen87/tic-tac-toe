require "set"
require "pry"

board = [1,2,3,4,5,6,7,8,9]

MAX_TURNS = 9

# def display_board(board)
# 	puts	
#   3.times do |row|
#     puts board[row * 3, 3].join(" | ")
#   end
#   puts
# end

def display_board(board)
  puts "
    #{board[0]} | #{board[1]} | #{board[2]}
    -- --- --
    #{board[3]} | #{board[4]} | #{board[5]}
    -- --- --
    #{board[6]} | #{board[7]} | #{board[8]}
    "
end

def greeting
	puts
	puts "WELCOME TO TIC TAC TOE"
	puts "FIRST PLAYER IS X"
	puts "SECOND PLAYER IS O"
	puts "PLAYER ONE GOES FIRST"
end

def take_turn(turn_count)
	puts "Enter a number from the board to place your piece"
	number = gets.chomp.to_i 
	until (1..9).include?(number)
    	puts "Please choose a number."
    	number = gets.chomp.to_i
	end
	number  
end

def turns_left(turn_count)
	MAX_TURNS - turn_count
end

def draw?(turn_count)
	turns_left(turn_count).zero?
end

def win?(current_positions)
	if current_positions == [1,2,3].to_set
		true
	elsif current_positions == [4,5,6].to_set	
		true
	elsif current_positions == [7,8,9].to_set
		true
	elsif current_positions == [1,4,7].to_set
		true
	elsif current_positions == [2,5,8].to_set
		true
	elsif current_positions == [3,6,9].to_set
		true
	elsif current_positions == [1,5,9].to_set
		true	
	elsif current_positions == [3,5,7].to_set
		true
	else
		false
	end
end

# def win?(current_positions) 
# # are any of the current player position included in the win?

# winnable_combos = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]].to_set

# 	winning_set = winnable_combos
# 	winning_set.map! do |win|  
# 	  if win == current_positions
# 	  	true
# 	  end
# 	end
# 	false
# end

def game_over(current_positions, turn_count)
	win?(current_positions) || draw?(turn_count)
end

def tictactoe(board)
	turn_count = 0
	p1 = "X"
	p2 = "O"	
	p1_progress = Set.new
	p2_progress = Set.new
	greeting
	current_player = p1
	current_positions = p1_progress
	until game_over(current_positions, turn_count)
		display_board(board)
		choice = take_turn(turn_count)
		board.map! do |number|
			if number == choice
			  current_player
			else
			  number
			end
		end
		current_positions.add(choice)
			if current_player == p1
      			current_player = p2
      			current_positions = p2_progress
    		else
      			current_player = p1
      			current_positions = p1_progress
      		end
      	turn_count += 1
	end
	postmortem(current_positions)
end



def postmortem(current_positions)
	if win?(current_positions)
		puts "CONGRATULATIONS YOU WIN"
	else
		puts "ITS A DRAW"
	end
end

tictactoe(board)

# display_board(board) ##always have to pass arguement


## DATA IN THE SYSTEM
# * board
# * player1 (name/piece), player2
# * win conditions
# * current_player => player1, player2

# board = {
#   1 => 1,
#   2 => 2,
#   3 => 3
# }

# board[0][1]
# board[1][2]

