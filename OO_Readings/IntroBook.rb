# OOP is a way for programmmers to store data and enables them to change small parts of code 
# without having it effect any other parts of the program.

# Encapsulation - is a form of data protection and allows a certain part of code to not
# be available to the rest of the code. It is accomplished in Ruby by creating objects and exposing methods 
# to interact with those objects. Also, creates a new level of abstraction. 

# Polymorphism - ability for data to be represented as different types. 

# the concept of inheritance is used in Ruby and it is where a class inherits the behaviors
# from another class called the SuperClass. 

# Modules are another way to use polymorphism. Modules are similar to classes in that they
# contain shared behavior. However, you cannot create an object with a module. To use a module,
# you use the keyword include. This is called a mixin. 

# classes are used to create objects. Modules cannot create objects.

# when defining classes, there are two things to focus on: states and behaviors. 
# States track attributes for each object and behaviors are what objects are capable of doing

# instance variables are scoped at the specific object (instance) while instance methods are soped
# at the entire class

# class methods are made by self.method
# class variables are made by @@variable

# when to inherit a class or inherit a module? if it's a 'is-a' relationship, then inherit subclass
# it it's a 'has-a' relationship, then include the module.

class Person
  attr_accessor :first_name, :last_name
  
  def initialize(name)
    @first_name = name.split.first
    @last_name = name.delete(@first_name)
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
end




bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                 # => 'Robert'














