require_relative 'carrig'
require_relative 'freight_carrig'
require_relative 'passenger_carrig'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'station'
require_relative 'route'

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

cargo_train = CargoTrain.new(1)
passenger_train = PassengerTrain.new(1)

arr_f.each { |carrig| cargo_train.add_carrig(carrig) }
arr_p.each { |carrig| passenger_train.add_carrig(carrig) }

cargo_train.show_carriages
passenger_train.show_carriages

cargo_train.delete_carrig(cargo_train.carrig[3])
passenger_train.delete_carrig(passenger_train.carrig[3])

cargo_train.delete_carrig
passenger_train.delete_carrig

cargo_train.show_carriages
passenger_train.show_carriages

station1 = Station.new('Санкт-Петербург')
station2 = Station.new('Владикавказ')
station3 = Station.new('Москва')
station4 = Station.new('Краснодар')

route1 = Route.new(station1, station2)
route1.add_stations(station3, station4)

cargo_train.add_route(route1)
passenger_train.add_route(route1)

station1.show_trains_info

cargo_train.speed = 150
cargo_train.show_speed
cargo_train.stop
cargo_train.show_speed

cargo_train.go
cargo_train.speed = 150
cargo_train.show_speed

station1.show_trains_info

cargo_train.go
cargo_train.go_back
cargo_train.show_where

cargo_train.delete_carrig
cargo_train.stop
cargo_train.delete_carrig
cargo_train.show_carriages

cargo_train.show_route

