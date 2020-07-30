#!/usr/bin/env ruby

#  Tic-Tac-Toe game consists of:
#
#  -Start the game.
#
#  -Get players' name.
#
#  -Assign a symbol for each player.
#
#  -Start the round.
#
#  -Display board.
#
#  -Get player's input for the cell he chooses.
#
#  -Play the logic for the different input possibilities.
#
#  -Check the score.
#
#  -Announce the winner or if it is a tie.
#
#  -Give the possibility of continue or quit.

# First class is for giving info about the game and getting players' info

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
    # Starting with the game logic
    Game.new
  end
end

# game logic
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

  # getting users' info
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
    game
  end

  # playing the game itself
  def game
    @turn = true
    loop do
      break if @turn == false

      @counter.length.times do
        break if @turn == false

        @counter.length.odd? ? player1_sym : player2_sym
        if @counter.any? { |x| x == @board }
          @counter.reject! { |x| x == @board }
          checking_input
        else
          puts 'UPS! already taken. Try again!'
        end
        score
      end
    end
    result
  end

  # checking users' input
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

  # case for player1
  def player1_sym
    @player_sym = '♥'
    player = @player1
    puts "#{player} choose your board:"
    result
    @board = gets.chomp
  end

  # case for player2
  def player2_sym
    @player_sym = '▩'
    player = @player2
    puts "#{player} choose your board:"
    result
    @board = gets.chomp
  end

  # checking score
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
      EndOrNewgame.new
    else
      @turn = true
    end
  end

  # displaying winner
  def player_winner
    @player = @var == '♥' ? @player1 : @player2
    puts '*****************'
    puts "     #{@player.upcase} WINS!"
    puts '*****************'
    @turn = false
  end

  # board display
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

class EndOrNewgame
  # getting continue input and acting accordingly
  def initialize
    puts "Nobody wins:( would you like to try again? Press 'y'. If you want to end the game press any key"
    response = gets.chomp
    response == 'y' ? Game.new : @turn = false
  end
end

Start.new

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
