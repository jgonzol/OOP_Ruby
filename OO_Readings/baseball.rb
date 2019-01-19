class League
  
  NAMES = %w(trout harper goldschmidt betts votto freeman arenado machado bellinger chapman)
  TOOLS = (1..100).to_a
  
  def initialize(name, number_of_players)
    @name = name
    @players = []
    1.upto(number_of_players) do |player|
      @players << Batter.new(NAMES.pop, TOOLS.sample, TOOLS.sample)
    end
  end
  
  def to_s
    @players.each do |batter|
      puts batter.name
      puts batter.hit
      puts batter.power
    end
  end
end

class Batter
  
  attr_reader :name, :hit, :power
  
  def initialize(name, hit, power)
    @name = name
    @hit = hit
    @power = power
  end
  
end

mlb = League.new('MLB', 10)

puts mlb