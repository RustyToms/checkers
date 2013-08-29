require "colorize"

class CheckerBoard
  attr_accessor :board

  def initialize
    @board = make_board
  end

  def make_board
    #makes board, hash by location, 7 cols of 8 rows
    #makes pieces by color, puts them in the correct location,
    #  gives them the correct direction
  end

  def print_board
    #print columns in reverse order (last first) to correct for possible movement calculation
  end

  def victory?
    #are there only pieces of one color remaining?
  end

  def make_move(move) #takes an array of arrays [from, to]
    #moves already tested for validity
    #piece moved from one loc to another
    #piece told that it moved, piece.move(move)
  end

end