# modify the following code to accept a string containing a first and a last name. The name should be split into two instance variables
# in the setter method, then joined in the getter method to form a full name.

class Person
  
  def name=(string)
    array = string.split
    @first = array[0]
    @last = array[-1]
  end
  
  def name
    @first + ' ' + @last
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name