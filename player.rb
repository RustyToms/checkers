
class Player
  attr_reader :name, :color

  def initialize(temp_name, color)
    @name = set_name(temp_name)
    @color = color
  end

  def set_name(temp_name)
    puts "#{temp_name}, what is your name?"
    @name = gets.chomp
  end

  def get_move
    #gets players move
    puts "Where would you like to move from and to?  (e.g. a3 b4)"
    input = gets.chomp
    #validates players move
    #  makes sure the move is typed correctly
    move = translate_input(input)
    #  make sure the move is available from the piece
    validate_move(move)
    #return move
    move
  end

  def translate_input(input)
    #change input to move and return it, raise error if needed
  end

  def validate_move(move)
    #makes sure move is available
  end
end