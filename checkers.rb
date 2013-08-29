require "colorize"

class Checkers
  attr_reader :board, :players
  def initialize
    @board = CheckerBoard.new
    @players = [Player.new, Player.new]
  end

  def play
    unless board.victory?
      board.print_board
      players[0].get_move
      players.reverse!
    end

    puts "#{player[1]} wins!!!!!!!!!!!!!!!!!!!!!!".blink

  end

end