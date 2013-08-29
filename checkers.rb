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
    until board.victory?
      begin
        board.print
        new_move = players[0].get_move
        players.reverse! unless board.make_move(new_move, players[0].color)
      rescue => msg
        puts "Invalid move, #{msg}".on_green.blink
        retry
      end
    end

    puts "#{players[0]} wins!!!!!!!!!!!!!!!!!!!!!!".blink

  end

end

test = Checkers.new
test.play