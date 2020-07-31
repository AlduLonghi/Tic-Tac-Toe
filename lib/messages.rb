module Messages
  def self.welcome
    puts ''
    puts '****************************************'
    puts ''
    puts '   WELCOME TO THE GAME!'
    puts ''
    puts '*****************************************'
    puts ''
  end

  def self.rules
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
  end

  def self.players(player_name, sym)
    puts ''
    puts "Hello #{player_name}! Your symbol is: #{sym}"
    puts ''
  end

  def self.winning_message(player)
    puts ''
    puts '**********************************'
    puts ''
    puts "Congratulations #{player}! You win!"
    puts ''
    puts '**********************************'
  end

  def self.tie_message
    puts ''
    puts 'Its a tie! Would you like to start again? Press y'
    puts ''
  end
end
