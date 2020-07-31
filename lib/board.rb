class Board
  attr_accessor :arr

  def initialize(arr = %w[a b c d e f g h i])
    @arr = arr
    board_draw
  end

  def board_draw
    puts '-------------------'
    puts '|     |     |     |'
    puts "|  #{@arr[0]}  |  #{@arr[1]}  |  #{@arr[2]}  |"
    puts '|     |     |     |'
    puts '-------------------'
    puts '|     |     |     |'
    puts "|  #{@arr[3]}  |  #{@arr[4]}  |  #{@arr[5]}  |"
    puts '|     |     |     |'
    puts '-------------------'
    puts '|     |     |     |'
    puts "|  #{@arr[6]}  |  #{@arr[7]}  |  #{@arr[8]}  |"
    puts '|     |     |     |'
    puts '-------------------'
  end
end
