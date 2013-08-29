# encoding: utf-8
require "colorize"
require "./checkerboard.rb"
require "./piece.rb"
require "./player.rb"

class Checkers
  attr_reader :board, :players

  def initialize
    @board = CheckerBoard.new
    @players = [Player.new("Player1", "white", board)]
    @players << Player.new("Player2", "black", board)
  end

  def play
    until board.victory?
        board.print
        players[0].make_move
        players.reverse!
    end

    puts "#{players[1]} wins!!!!!!!!!!!!!!!!!!!!!!".blink

  end

end

test = Checkers.new
test.play