# using the following code, add two methods, generic_greeting and personal_greeting. The first should be a class method 
# and print a greeting that is generic to the class. The second method should be an instance method and print a greeting that's custom to the object.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def self.generic_greeting
    puts "CLASSSS"
  end
  
  def personal_greeting
    puts "This is for this one specific kitty"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting