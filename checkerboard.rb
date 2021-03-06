# encoding: utf-8
require "colorize"
require "./piece.rb"

class CheckerBoard
  attr_accessor :board

  def initialize
    player1_pieces = {color: "white", direction: [1, 2], name: "☺" }
    player2_pieces = {color: "black", direction: [-1, -2], name: "☻" }
    @board = make_board(player1_pieces, player2_pieces)
  end

  def make_board(player1_pieces, player2_pieces)

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
    # letters = ("0".."7").map(&:to_s).map { |char| char }.join
    numbers = ("0".."7").map { |char| char }
    puts "  #{numbers.join("  ")}"

    7.downto(0) do |y|
      row = [numbers[y]]
      8.times do |x|
        if !board[[x, y]].nil?
          row << " #{board[[x, y]]} "
        elsif (x + y).even?
          row << "   "
        else
          row << "   ".on_red
        end
      end

      row << numbers[y]
      row = row.join

      puts row
    end

    puts "  #{numbers.join("  ")}"
  end

  def victory?
    color = ["white", "black"]
    board.each_value{ |piece| color.delete(piece.color) }
    return true unless color.empty?
  end

  def make_move(move, color)
    from, to, dx, dy, piece = split_move_parts(move)

    if piece.nil? or piece.color != color
      raise ArgumentError.new "can't move that."
    end
    raise ArgumentError.new "wrong direction." unless piece.delta.include?(dy)
    raise ArgumentError.new "invalid position." unless dy.abs == dx.abs
    p to; p " + "; p board[to]
    raise ArgumentError.new "position full." unless board[to].nil?

    jumped = is_valid_jump(move, color)
    board.delete(jumped)

    board[to] = piece
    board.delete(from)
    piece.move(to)

    jumped
  end

  def split_move_parts(move)
    from, to = move
    dx = to[0] - from[0]
    dy = to[1] - from[1]
    piece = board[from]
    [from, to, dx, dy, piece]
  end

  def is_valid_jump(move, color)
    from, to, dx, dy, piece = split_move_parts(move)
    return false unless dx.abs == 2 && dy.abs == 2 && board[to].nil?
    return false unless piece.delta.include?(dy)

    jumped = [(from[0] + dx / 2), (from[1] + dy / 2)]
    if board[jumped].nil? || board[jumped].color == piece.color
      return false
    end

    jumped
  end

  # make_jump

end