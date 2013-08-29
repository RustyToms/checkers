# encoding: utf-8
require "colorize"
require "./piece.rb"

class CheckerBoard
  attr_accessor :board

  def initialize
    player1_pieces = {color: "white", direction: [1], name: "☺" }#.on_green}
    player2_pieces = {color: "black", direction: [-1], name: "☻" }#.on_green}
    @board = make_board(player1_pieces, player2_pieces)
  end

  def make_board(player1_pieces, player2_pieces)
    #makes board
    new_board = Hash.new
    (0..7).each do |col|
      (0..7).each do |row|
        if (row + col).even? && row < 3
          new_board[[col, row]] = Piece.new([col, row], player1_pieces)
        elsif (row + col).even? && row > 4
          new_board[[col, row]] = Piece.new([col, row], player2_pieces)
        end
      end
    end
    new_board
  end

  def print
    letters = ("A".."H").map(&:to_s).map { |char| char }.join
    numbers = ("1".."8").map { |char| char }
    puts " #{letters}"

    7.downto(0) do |y|
      row = [numbers[y]]
      8.times do |x|
        # puts "board x y is #{board[[x, y]]}"
        # puts "x + y = #{(x + y)}"
        if !board[[x, y]].nil?
          row << board[[x, y]].name
        elsif (x + y).even?
          row << " "#.on_green
        else
          row << " ".on_red
        end
        # puts "#{row.last} was added to row"
      end

      row << numbers[y]
      row = row.join

      puts row
    end

    puts " #{letters}"
  end

  def victory?
    color = ["white", "black"]
    #are there only pieces of one color remaining?
    board.each_value{ |piece| color.delete(piece.color) }
    return true unless color.empty?
  end

  def make_move(move) #takes an array of arrays [from, to]
    #moves already tested for validity
    #piece moved from one loc to another
    #piece told that it moved, piece.move(move)
    board[move[1]] = board[move[0]]
    board[move[0]].delete
    board[move[1]].pos = move[1]
  end

end