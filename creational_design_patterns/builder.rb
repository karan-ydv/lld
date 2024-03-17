class Car
  # A car can have a GPS, trip computer and some number of
  # seats. Different models of cars (sports car, SUV,
  # cabriolet) might have different features installed or
  # enabled.
end

class Manual
  # Each car should have a user manual that corresponds to
  # the car's configuration and describes all its features.
end

class Builder
  def reset=              raise NotImplementedError
  def set_seats(n)=       raise NotImplementedError
  def set_engine=         raise NotImplementedError
  def set_trip_computer=  raise NotImplementedError
  def set_gps=            raise NotImplementedError
  def get_product=        raise NotImplementedError
end

def CarBuilder
  attr_accessor :car

  def initialize
    reset
  end

  def reset
    @car = Car.new
  end

  def set_seats(n)
    # Set the number of seats in the car.
  end

  def set_engine(engine)
    # Install a given engine.
  end

  def set_trip_computer(enabled)
    # Install a trip computer.
  end
  
  # ...
end

def ManualBuilder
  # ... Same as CarBuilder
end

def Director
  def create_sports_car(builder)
    builder.reset
    builder.set_seats(2)
    builder.set_engine(SportsEngine.new)
    builder.set_trip_computer(true)
    builder.set_gps(true)
    build.get_product
  end

  def create_suv(builder)
    builder.reset
    builder.set_seats(4)
    builder.set_engine(SUVEngine.new)
    builder.set_trip_computer(true)
    builder.set_gps(true)
    build.get_product
  end
end

class Application

    method makeCar() is
        director = new Director()

        CarBuilder builder = new CarBuilder()
        director.constructSportsCar(builder)
        Car car = builder.getProduct()

        CarManualBuilder builder = new CarManualBuilder()
        director.constructSportsCar(builder)

        // The final product is often retrieved from a builder
        // object since the director isn't aware of and not
        // dependent on concrete builders and products.
        Manual manual = builder.getProduct()
