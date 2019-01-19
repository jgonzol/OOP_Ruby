class GuessingGame
  attr_accessor :guesses
  
  def initialize
    @number = (1..100).to_a.sample
    @guesses = 7
  end
  
  def play
    loop do
      message
      guess = nil
      loop do
        guess = gets.chomp.to_i
        break if valid?(guess)
        puts "Invalid guess. Enter a number between 1 and 100:"
      end
      winning_message if correct?(guess)
      break if correct?(guess)
      self.guesses -= 1
      lose_message if guesses == 0
      break if guesses == 0
      hint_message(guess)
    end
  end

  def message
    puts "You have #{guesses} remaining."
    puts "Enter a number between 1 and 100:"
  end

  def winning_message
    puts "That's the number!"
    puts ""
    puts "You won!"
  end

  def hint_message(guess)
    if guess < @number
      puts "Your guess is too low."
    else
      puts "Your guess is too high."
    end
  end

  def lose_message
    puts "You ran out of guesses! You lose."
  end

  def valid?(guess)
    guess > 1 && guess <= 100
  end

  def correct?(guess)
    guess == @number
  end
end

game = GuessingGame.new
game.play