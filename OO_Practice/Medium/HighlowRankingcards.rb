# Update this class so you can use it to determine the lowest ranking and highest ranking cards in an Array of Card objects.

class Card
  include Comparable
  attr_reader :rank, :suit
  
  VALUES = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}
  SUIT_RANK = {'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def <=>(other)
    value <=> other.value
  end
  
  def value
    VALUES.fetch(rank, rank)
  end
  
  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  attr_reader :cards
  
  def initialize
    reset
  end
  
  def draw
    @cards.pop
  end
  
  private
  
  def reset
    @cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13
  

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
