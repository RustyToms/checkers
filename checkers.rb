# encoding: utf-8
require "colorize"
require "./checkerboard.rb"
require "./piece.rb"
require "./player.rb"

class Checkers
  attr_reader :board, :players
  def initialize
    @board = CheckerBoard.new
    @players = [Player.new("Player1", "white"), Player.new("Player2", "black")]
  end

  def play
    unless board.victory?
      board.print
      board.make_move = players[0].get_move
      players.reverse!
    end

    puts "#{player[1]} wins!!!!!!!!!!!!!!!!!!!!!!".blink

  end

end

test = Checkers.new
test.board.print