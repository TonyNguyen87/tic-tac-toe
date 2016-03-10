require "pry"
require "minitest/autorun"

# require "./tictactoe"
require "./board"
require "./humanplayer"
require "./computerplayer"
require "./game"

class HumanPlayerTest < Minitest::Test
	def test_can_build_human_player
		assert HumanPlayer.new
		assert HumanPlayer.new ("X")
	end

	def test_can_human_know_piece
		tony = HumanPlayer.new
		tony.stub :puts, nil do
		  tony.stub :gets, "X" do
			tony.choose_piece
		  end
		end
		assert tony.piece == "X"
	end

	def test_cannot_make_illegal_moves
		tony = HumanPlayer.new
		tony.stub :gets, "7" do
			move = tony.take_turn
			assert move.is_a?(Fixnum)
			assert (1..9).include?(move)
		end
	end
end

class ComputerPlayerTest < Minitest::Test
	def test_can_build_computer_player
		assert ComputerPlayer.new
		assert ComputerPlayer.new ("O")
	end

	def test_can_computer_take_turn
		cpu = ComputerPlayer.new
		array = [1, 2, 3, 4]
		assert = cpu.take_turn(array)
	end

	def test_can_cpu_know_piece
		cpu = ComputerPlayer.new
		  cpu.stub :gets, "O" do
			cpu.choose_piece
			  end
		assert cpu.piece == "O"
	end
end


class BoardTests < Minitest::Test
	def test_can_build_board
		assert Board.new
	end

	def test_can_board_determine_available_moves
		board = Board.new
		space_available = board.available_moves
		assert space_available
	end

end

class GameTests < Minitest::Test
	def setup
		player1 = HumanPlayer.new
		player2 = ComputerPlayer.new
		board = Board.new
	@game = Game.new(player1, player2, board)
	end

	def test_can_switch_player
		tony = HumanPlayer.new
		cpu = ComputerPlayer.new
		current_player = tony
		assert @game.switch_player(current_player)
	end

	def test_can_win?
		board = ["X", 2, 3, "X", 5, 6, "X", 7, 8 ,"X"]
		winner = @game.win?(board)
		assert winner
	end

	# def test_can_i_choose_type_players
	# end
end











