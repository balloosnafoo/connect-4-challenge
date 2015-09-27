require_relative "./board.rb"
require_relative "./player.rb"

class ConnectFour
  def initialize(height, width, win_length)
    @board = Board.new(height, width, win_length)
    @players = [
      Player.new(:white),
      Player.new(:red)
    ]
    @board.render
  end

  def play
    loop do
      move = current_player.take_turn
      unless @board.is_valid?(move)
        puts "You can't move there"
        next
      end
      result = @board.execute_move(move, current_player.color)
      @board.render
      break if result
      @players.rotate!
    end
    congratulate_winner
  end

  def congratulate_winner
    puts "Congratulations #{@players.first.color} player, you win!"
  end

  def current_player
    @players.first
  end
end

if __FILE__ == $PROGRAM_NAME
  cf = ConnectFour.new(10, 10, 4)
  cf.play
end
