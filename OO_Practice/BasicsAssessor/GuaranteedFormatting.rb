# using the following code, add the appropriate accessor methods so that @name is capitalized upon assighment

class Person
  attr_reader :name
  
  def name=(string)
    @name = string.capitalize!
  end
  
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name