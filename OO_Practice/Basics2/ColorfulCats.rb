# create a class named Cat that prints a greeting when #greet is invoked. The greeting should include the 
# name and color of the cat. Use a constant to define the color.

class Cat
  COLOR = 'gray'
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello, my name is #{name} and I am #{COLOR}"
  end
  
  
end

kitty = Cat.new('Sophie')
kitty.greet