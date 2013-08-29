
class Piece
  attr_accessor :location, directions
  attr_reader :color

  def intialize(color, direction)
    @color = color
    @king_status = false
    @directions = direction  #array with either 1 or -1, gets both when kinged

  end

  def move(move) #move == [from, to], array of arrays
    #piece changes its location
    #if location is end of board, piece becomes king
  end

  def possible_moves
    #all moves in the direction of self.direction either in the row or over to the next column
    #if any enemy pieces are in those locations, those locations are replaced with the locations beyond them, but only if they are empty.
  end

end