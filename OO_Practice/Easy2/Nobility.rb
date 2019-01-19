

class Noble
  attr_reader :name, :title
  
  def initialize(name, title)
    @name = name
    @title = title
  end
  
  def walk
    puts "#{title} #{name} struts forward"
  end
  
end


byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"