class FreightCarrig < Carrig
  attr_reader :cargo_capacity

  def initialize(number, cargo_capacity)
    super(number)
    @cargo_capacity = cargo_capacity
  end

  def to_s
    super + "грузоподъемность: #{cargo_capacity}"
  end
end
