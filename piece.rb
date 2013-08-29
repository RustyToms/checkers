# encoding: utf-8
class Piece
  attr_accessor :pos, :delta, :name
  attr_reader :color

  def initialize(pos, info_hsh)
    @color = info_hsh[:color]
    @delta = info_hsh[:direction]
    @name = info_hsh[:name]
    @pos = pos

  end

  def move(new_pos)
    self.pos = new_pos
    if [self.pos[1], self.color] == 7 && self.color == "white"
      king_me
    elsif self.pos[1] == 0 && self.color == "black"
      king_me
    end
  end

  def to_s
    self.name
  end

  def king_me
    self.directions = [1, -1]
    self.name = (color == "white" ? ♔.on_green : ♚.on_green)
  end

end