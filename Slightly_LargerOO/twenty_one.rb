=begin
twenty one is a game where there is a player and a dealer
two cards are dealt to both players 
the values of the cards for each player are added, the greatest wins the hand
however, if value is greater than 21, the players 'busts' and loses
the second card for the dealer is not shown
after the initial cards are dealt, the player can choose to 'hit' or 'stay'
when they choose to hit, another card is given to the player
the value of this card adds to the total value of the hand
when player chooses to 'stay' all cards are revealed 

nouns: players, cards, hands, game, total
verbs: hit, stay, deal, bust

Player
-hit
-stay
-bust
-total
=end


class Card
  SUITS = ['H', 'D', 'C', 'S']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  
  def initialize(suit, face)
    @suit = suit
    @face = face
  end
  
  def to_s
    "The #{face} of #{suit}"
  end
  
  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end
  
  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'C' then 'Clubs'
    when 'S' then 'Spades'
    else
      @suit
    end
  end
  
  def ace?
    face == 'Ace'
  end
  
  def king?
    face == 'King'
  end
  
  def queen?
    face == 'Queen'
  end
  
  def jack?
    face == 'Jack'
  end
end

class Deck
  attr_accessor :cards
  
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
    
    scramble!
  end
  
  def scramble!
    cards.shuffle!
  end
  
  def deal_one
    cards.pop
  end
end

module Hand
  def show_hand
    puts "---- #{name}'s Hand----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end
  
  def total
    total = 0
    cards.each do |card|
      if card.ace?
        total += 11
      elsif card.jack? || card.queen? || card.king?
        total += 10
      else
        total += card.face.to_i
      end
    end
    
    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end
    
    total
  end
  
  def add_card(new_card)
    cards << new_card
  end
  
  def busted?
    total > 21
  end
end

class Participant
  include Hand
  
  attr_accessor :name, :cards
  def initialize
    @cards = []
    set_name
  end
end

class Player < Participant
  def set_name
    name = ''
    loop do
      puts "What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    self.name = name
  end
  
  def show_flop
    show_hand
  end
end

class Dealer < Participant
  ROBOTS = ['Sally', '01110101', 'BigGameChump', 'R2D2', 'Chompie']
  
  def set_name
    self.name = ROBOTS.sample
  end
  
  def show_flop
    puts "---- #{name}'s hand ----"
    puts "#{cards.first}"
    puts " ?? "
    puts ""
  end
end

class TwentyOne
  attr_accessor :deck, :player, :dealer
  
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end
  
  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def deal_cards
    2.times do 
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end
  
  def show_flop
    player.show_flop
    dealer.show_flop
  end
  
  def player_turn
    puts "#{player.name}'s turn..."
    
    loop do
      puts "Would you like to (h)it or (s)tay?"
      answer = nil
      loop do
        answer = gets.chomp.downcase
        break if ['h', 's'].include? answer
        puts "Sorry, that is not a valid choice."
      end
      
      if answer == 's'
        puts "#{player.name} stays!"
        break
      elsif player.busted?
        break
      else
        player.add_card(deck.deal_one)
        puts "#{player.name} hits!"
        player.show_hand
        break if player.busted?
      end
    end
  end
  
  def dealer_turn
    puts "#{dealer.name}'s turn..."
    
    loop do
      if dealer.total > 17 && !dealer.busted?
        puts "#{dealer.name} stays!"
        break
      elsif dealer.busted?
        break
      else
        puts "#{dealer.name} hits!"
        dealer.add_card(deck.deal_one)
      end
    end
  end
  
  def show_busted
    if player.busted?
      puts "It looks like #{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "It looks like #{dealer.name} busted! #{player.name} wins!"
    end
  end
  
  def show_cards
    player.show_hand
    dealer.show_hand
  end
  
  def show_result
    if player.total > dealer.total
      puts "It looks like #{player.name} wins!"
    elsif player.total < dealer.total
      puts "It looks like #{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end
  
  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, that is not a valid choice."
    end
    
    answer == 'y'
  end
  
  def start
    loop do
      system 'clear'
      deal_cards
      show_flop
      
      player_turn
      if player.busted?
        show_busted
        if play_again?
          reset
          next
        else
          break
        end
      end
      
      dealer_turn
      if dealer.busted?
        show_busted
        if play_again?
        reset
        next
        else
          break
        end
      end
    
    
      show_cards
      show_result
      play_again? ? reset : break
    end
  
    puts "Thanks for playing twenty-one!"
  end
end
    
        

TwentyOne.new.start