#!/usr/bin/env ruby

=begin
 Tic-Tac-Toe game consists of:

 -Start the game.

 -Get players' name.

 -Assign a symbol for each player.

 -Start the round.

 -Display board.

 -Get player's input for the cell he chooses.

 -Play the logic for the different input possibilities.

 -Check the score.

 -Announce the winner or if it is a tie.

 -Give the possibility of continue or quit.
=end

#First class is for giving info about the game and getting players' info

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
      players
      #Starting with the game logic
      play = Game.new
    end

    def players 
      puts ' '
      puts 'PLEASE ENTER PLAYER NAME 1: '
      $player1 = gets.chomp()
      puts ' '
      puts "Hello #{$player1}! Your symbol is: ♥"
      puts ' '
      puts 'PLEASE ENTER PLAYER NAME 2: '
      $player2 = gets.chomp()
      puts ' '
      puts "Hello #{$player2}! Your symbol is: ▩"
      puts ' '
      puts "Lets begin with #{$player1}!"
      puts ' '
    end

end

class Game 
    #setting variables for input options 
    $a = "a"
    $b = "b"
    $c = "c"
    $d = "d"
    $e = "e"
    $f = "f"
    $g = "g"
    $h = "h"
    $i = "i"
    $counter = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
    $player_sym #Will depend on the player playing the turn 

    def initialize

        #This is just to show the approach on using user's input. Game logic will be loop based.

        puts ''
        puts "Please #{$player1} choose your cell:"
        puts ''
        result
        cell = gets.chomp()

        #Logic checking possibilities and removing taken elements 

         if cell == "a"
            $a = "♥" #$player_sym
            #remove "a" from $counter
         else 
            $a = $a
         end
         puts ''
         puts "Please #{$player2} choose your cell:"
         puts ''
         result
         cell = gets.chomp()

         #Logic checking possibilities and removing taken elements 

          if cell == "b"
             $b = "▩" #$player_sym
             #remove "b" from $counter
          else
             $b = $b
          end
          result
          score = Score.new
        end

    #displaying board 
    def result 
        puts "-------------------"
        puts "|     |     |     |"
        puts "|  #{$a}  |  #{$b}  |  #{$c}  |"
        puts "|     |     |     |"
        puts "-------------------"
        puts "|     |     |     |"
        puts "|  #{$d}  |  #{$e}  |  #{$f}  |"
        puts "|     |     |     |"
        puts "-------------------"
        puts "|     |     |     |"
        puts "|  #{$g}  |  #{$h}  |  #{$i}  |"
        puts "|     |     |     |"
        puts "-------------------"
    end
end

#checking the inputs searching for coincidences 
class Score 
    def initialize
        #checking inputs and coincidences 
        #if player1 wins 
        #puts "#{player1} is the winner!"
        #if player2 wins 
        #puts "#{player2} is the winner!"
        #if its a tie
        puts ''
        puts 'Nobody wins this time, would you like to try again? Press y. Else press any key'
        puts ''
        continue
    end

    def continue 
        response = gets.chomp()
        if response == "y"
            $a = "a"
            $b = "b"
            $c = "c"
            $d = "d"
            $e = "e"
            $f = "f"
            $g = "g"
            $h = "h"
            $i = "i"
            $counter = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
            again = Game.new
        end
    end
end


game = Start.new
