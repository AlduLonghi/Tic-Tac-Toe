#!/usr/bin/env ruby
require './messages.rb'
require './game.rb'
require './logic.rb'
require './board.rb'

class TicTacToe
  include Messages

  def initialize
    @counter = %w[a b c d e f g h i]
    @counter_for_display = %w[a b c d e f g h i]
    Messages.welcome
    Messages.rules
    players_info
  end

  def players_info
    puts 'PLEASE ENTER PLAYER NAME 1: '
    @player1 = gets.chomp
    Messages.players(@player1, '♥')
    puts 'PLEASE ENTER PLAYER NAME 2: '
    @player2 = gets.chomp
    Messages.players(@player2, '▩')
    puts "Lets begin with #{@player1}!"
    rounds
  end

  def rounds
    @turn = true
    @counter = %w[a b c d e f g h i]
    @counter_for_display = %w[a b c d e f g h i]
    loop do
      break if @turn == false

      @counter.length.times do
        break if @turn == false

        @counter.length.odd? ? player_selection('♥', @player1) : player_selection('▩', @player2)
        if @counter.any? { |x| x == @cell }
          ind = @counter_for_display.index(@cell)
          @counter_for_display[ind] = @sym
          @counter.reject! { |x| x == @cell }
          result(@counter_for_display, @sym, @player)
        else
          puts 'UPS! already taken or not a cell name. Try again!'
        end
      end
    end
  end

  def player_selection(sym, player)
    @sym = sym
    @player = player
    Board.new(@counter_for_display)
    puts "#{player} choose your cell: "
    @cell = gets.chomp
    @cell
  end

  def result(counter, sym, player)
    score = Logic.new(counter, sym)
    if score.checking == true
      Messages.winning_message(player)
      Board.new(counter)
      @turn = false
    elsif @counter.empty?
      Messages.tie_message
      response = gets.chomp
      response == 'y' ? rounds : @turn = false
    else
      @turn = true
    end
  end
end

TicTacToe.new
