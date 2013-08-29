# encoding: utf-8
class Piece
  attr_accessor :pos, :directions, :name
  attr_reader :color

  def initialize(pos, info_hsh)
    @color = info_hsh[:color]
    @directions = info_hsh[:direction]
    @name = info_hsh[:name]
    @pos = pos

  end

  def move(move) #move == [from, to], array of arrays
    #piece changes its location
    #if location is end of board, piece becomes king
  end

  def possible_moves
    #all moves in the direction of self.direction either in the row or over to the next column
    #if any enemy pieces are in those locations, those locations are replaced with the locations beyond them, but only if they are empty.
  end

  def pos_x  #translates hash location x to standard board location x
    (pos[0] - pos[1] + 4)
  end

  def pos_y #translates hash location y to standard board location y
    (10 - pos[0] - pos[1])
  end

  def king_me
    self.directions = [1, -1]
    self.name = (color == "white" ? ♔.on_green : ♚.on_green)
  end

end