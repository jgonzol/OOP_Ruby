#modify code so that value of @phone_number cannot be modified outside of the class

class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
  
  private
  attr_writer :phone_number
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number