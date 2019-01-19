# using the following code, create a class named Cat that tracks the number of times a new Cat object is instantiated. 
# the total number of cat instances should be printed when #total is invoked.

class Cat
  @@number_cats = 0
  
  def initialize
    @@number_cats += 1
  end
  
  def self.total
    @@number_cats
  end
    
end

kitty1 = Cat.new
kitty2 = Cat.new

p Cat.total