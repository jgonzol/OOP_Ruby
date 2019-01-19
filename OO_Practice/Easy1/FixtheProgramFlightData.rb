

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
  
end

#the database_handle instance varialbe is easy to change, and that may not be what we want