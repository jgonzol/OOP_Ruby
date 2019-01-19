# this will represent the Move objects
class Move
  VALUES = %w(rock paper scissors).freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def paper?
    @value == 'paper'
  end

  def rock?
    @value == 'rock'
  end

  def >(other)
    (rock? && other.scissors?) ||
      (paper? && other.rock?) ||
      (scissors? && other.paper?)
  end

  def <(other)
    (rock? && other.paper?) ||
      (paper? && other.scissors?) ||
      (scissors? && other.rock?)
  end

  def to_s
    @value
  end
end

# This will be Superclass to Human and Computer.
class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

# Human Class representing Human objects. Subclass to Player class
class Human < Player
  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, or scissors:'
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts 'Please enter a valid choice'
    end
    self.move = Move.new(choice)
  end

  def set_name
    n = ''
    loop do
      puts 'What is your name?'
      n = gets.chomp
      break unless n.empty?
      puts 'Please enter a name.'
    end
    self.name = n
  end
end

# Computer class representing Computer objects. Subclass to Player class
class Computer < Player
  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end
end

# Main class representing the game. Initializes the Human and computer objects.
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors #{human.name}!"
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors. Goodbye!'
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def dispay_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp
      break if %w(y n).include? answer.downcase
      puts 'Sorry, must be y or n.'
    end

    return true if answer == 'y'
    false
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      dispay_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
