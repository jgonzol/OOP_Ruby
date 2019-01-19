#create a module name Transportation that contains three classes: Vehicle, Truck, and Car. Truck and Car should inherit from Vehicle

module Transportation
  
  class Vehicle
    
  end
  
  class Truck < Vehicle
    
  end
  
  class Car < Vehicle
    
  end
  
end

hey = Transportation::Truck.new
p hey
