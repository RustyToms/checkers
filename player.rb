require "./checkerboard.rb"

class Player
  attr_reader :name, :color, :board

  def initialize(temp_name, color, board)
    @name = set_name(temp_name)
    @color = color
    @board = board
  end

  def set_name(temp_name)
    puts "#{temp_name}, what is your name?"
    @name = gets.chomp
  end

  def make_move
    begin
      move = get_move
      jump = board.make_move(move, color)
    rescue => msg
      puts "Invalid move, #{msg}".blink.on_green
      retry
    end
    begin
      while jump && jump_available(move[1])
        move = get_jump_move(move[1], color)
        jump = board.make_move(move, color)
      end
    rescue => msg
      puts "Invalid move, #{msg}".blink.on_green
      retry
    end
  end

  def get_move
    puts "#{self.name}, where would you like to move from and to?"
    puts "(column number then row, e.g. 02 13)"
    input = gets.chomp

    translate_input(input)
  end

  def jump_available(pos)
    7.downto(0) do |y|
      8.times do |x|
        return true if board.is_valid_jump([pos, [x, y]], color)
      end
    end
    false
  end

  def get_jump_move(pos, color)
    board.print
    puts "#{self.name}, you may jump again.  Input new move."
    input = gets.chomp

    move = translate_input(input)
    unless move[0] == pos && board.is_valid_jump(move, color)
      puts "Invalid jump, try again".blink.on_green
      get_jump_move(pos, color)
    end
    move.dup
  end

  def translate_input(input)
    input.gsub!(/[^0-7]/, "")
    raise ArgumentError.new "4 numbers needed." unless input.length == 4
    from = [input[0].to_i, input[1].to_i]
    to = [input[2].to_i, input[3].to_i]
    [from, to]
  end

end