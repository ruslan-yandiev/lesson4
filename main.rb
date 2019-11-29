require_relative 'carrig'
require_relative 'freight_carrig'
require_relative 'passenger_carrig'

arr_f = []
arr_p = []

1.upto(5) do |number|
  freight_carrig = FreightCarrig.new(number, 5000)
  arr_f << freight_carrig

  passenger_carrig = PassengerCarrig.new(number, 100)
  arr_p << passenger_carrig
end

arr_f.each { |carrig| puts carrig }
arr_p.each { |carrig| puts carrig }
