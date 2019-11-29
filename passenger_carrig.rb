class PassengerCarrig < Carrig
  attr_reader :passenger_capacity

  def initialize(number, passenger_capacity)
    super(number)
    @passenger_capacity = passenger_capacity
  end

  def to_s
    super + "вместимость: #{passenger_capacity} человек"
  end
end
