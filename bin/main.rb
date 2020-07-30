#!/usr/bin/env ruby
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
class Start
  def initialize
    puts ' '
    puts '************************************************************************************************************'
    puts ' '
    puts '                                     WELCOME TO THE GAME!'
    puts ' '
    puts '************************************************************************************************************'
    puts ' '
    puts ' '
    puts '                       RULES FOR TIC-TAC-TOE:'
    puts ' '
    puts '1. The game is played on a grid that\'s 3 squares by 3 squares.'
    puts ' '
    puts '2. You are assigned a symbol to play with and your friend is assigned another one.'
    puts ' '
    puts '3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.'
    puts ' '
    puts '4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie.'
    puts ' '
    puts ' '
    Game.new
  end
end

class Game
  def initialize
    @a = 'a'
    @b = 'b'
    @c = 'c'
    @d = 'd'
    @e = 'e'
    @f = 'f'
    @g = 'g'
    @h = 'h'
    @i = 'i'
    @counter = %w[a b c d e f g h i]
    players
  end

  def players
    puts ' '
    puts 'PLEASE ENTER PLAYER NAME 1: '
    @player1 = gets.chomp
    puts ' '
    puts "Hello #{@player1}! Your symbol is: ♥"
    puts ' '
    puts 'PLEASE ENTER PLAYER NAME 2: '
    @player2 = gets.chomp
    puts ' '
    puts "Hello #{@player2}! Your symbol is: ▩"
    puts ' '
    puts "Lets begin with #{@player1}!"
    puts ' '
    rounds
  end

  def rounds
    @turn = true
    loop do
      break if @turn == false

      @counter.length.times do
        break if @turn == false

        @counter.length.odd? ? player1_sym : player2_sym
        if @counter.any? { |x| x == @board }
          @counter.reject! { |x| x == @board }
          checking_input
          score
        else
          puts 'UPS! already taken or not a cell name. Try again!'
        end
      end
    end
    result
  end

  def checking_input
    if @board == 'a'
      @a = @player_sym
    elsif @board == 'b'
      @b = @player_sym
    elsif @board == 'c'
      @c = @player_sym
    elsif @board == 'd'
      @d = @player_sym
    elsif @board == 'e'
      @e = @player_sym
    elsif @board == 'f'
      @f = @player_sym
    elsif @board == 'g'
      @g = @player_sym
    elsif @board == 'h'
      @h = @player_sym
    elsif @board == 'i'
      @i = @player_sym
    end
  end

  def player1_sym
    @player_sym = '♥'
    player = @player1
    puts "#{player.upcase} choose your board:"
    result
    @board = gets.chomp
  end

  def player2_sym
    @player_sym = '▩'
    player = @player2
    puts "#{player.upcase} choose your board:"
    result
    @board = gets.chomp
  end

  def score
    if @a == @b && @b == @c || @a == @d && @d == @g
      @var = @a
      player_winner
    elsif @d == @e && @e == @f || @b == @e && @e == @h
      @var = @e
      player_winner
    elsif @g == @h && @h == @i || @c == @f && @f == @i
      @var = @i
      player_winner
    elsif @a == @e && @e == @i || @c == @e && @e == @g
      @var = @e
      player_winner
    elsif @counter.empty?
      result
      EndOrContinue.new
    else
      @turn = true
    end
  end

  def player_winner
    @player = @var == '♥' ? @player1 : @player2
    puts ''
    puts '*****************'
    puts "    #{@player.upcase} WINS!"
    puts '*****************'
    puts ''
    @turn = false
  end

  def result
    puts '-------------------'
    puts '|     |     |     |'
    puts "|  #{@a}  |  #{@b}  |  #{@c}  |"
    puts '|     |     |     |'
    puts '-------------------'
    puts '|     |     |     |'
    puts "|  #{@d}  |  #{@e}  |  #{@f}  |"
    puts '|     |     |     |'
    puts '-------------------'
    puts '|     |     |     |'
    puts "|  #{@g}  |  #{@h}  |  #{@i}  |"
    puts '|     |     |     |'
    puts '-------------------'
  end
end

class EndOrContinue
  def initialize
    puts '*********************************************************************************************'
    puts "It's a tie! Would you like to try again? Press 'y'. If you want to end the game press any key"
    puts '*********************************************************************************************'
    response = gets.chomp
    response == 'y' ? Game.new : @turn = false
  end
end

Start.new

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
