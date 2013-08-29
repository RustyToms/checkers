
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
    puts "#{self.name}, where would you like to move from and to?"
    puts "(column number then row, e.g. 02 13)"
    input = gets.chomp

    translate_input(input)
    move = translate_input(input)

    move
  end

  def translate_input(input)
    input.gsub!(/[^0-7]/, "")
    raise ArgumentError.new "4 numbers needed." unless input.length == 4
    from = [input[0].to_i, input[1].to_i]
    to = [input[2].to_i, input[3].to_i]
    [from, to]
  end

end