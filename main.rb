require_relative 'carrig'
require_relative 'freight_carrig'
require_relative 'passenger_carrig'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'station'
require_relative 'route'
require_relative 'methods'

arr = [
"- Создавать станции",
"- Создавать поезда",
"- Создавать маршруты и управлять станциями в нем (добавлять, удалять)",
"- Назначать маршрут поезду",
"- Добавлять вагоны к поезду",
"- Отцеплять вагоны от поезда",
"- Перемещать поезд по маршруту вперед и назад",
"- Просматривать список станций и список поездов на станции"]

puts 'Программа позволит:'
arr.each { |x| puts x }

@hh_station = {}
@hh_route = {}

station

route

begin
  puts 'Хотите скоректировать какой-то маршрут? (да/нет)'
  yes_or_no = gets.chomp

  if yes_or_no == 'да'
    puts 'Укажите имя маршрута который нужно скоректировать'
    number_route = gets.chomp

    destroy_station(number_route)
  end
end while yes_or_no != 'нет' && yes_or_no != ''


puts 'Сколько грузовых и товарных вагонов создать?'
quantity = gets.chomp.to_i

@arr_f = []
@arr_p = []

1.upto(quantity) do |number|
  @arr_f << FreightCarrig.new(number, 5000)

  @arr_p << PassengerCarrig.new(number, 100)
end

puts 'Сколько грузовых и товарных поездов создать?'
quantity = gets.chomp.to_i

@arr_cargo_train = []
@arr_passenger_train = []

1.upto(quantity) do |number|
  @arr_cargo_train << CargoTrain.new(number)

  @arr_passenger_train << PassengerTrain.new(number)
end

puts 'Присоединить к созданным поездам имеющиеся вагоны? (да/нет)?'
yes_or_no = gets.chomp

connect_carrig if yes_or_no == 'да'

puts 'Отобразить информацию о вагонах у поездов? (да/нет)?'
yes_or_no = gets.chomp

show_carr if yes_or_no == 'да'

puts 'Хотите отцепить товарные вагоны? (да/нет)?'
yes_or_no = gets.chomp

if yes_or_no == 'да'
  puts 'сколько вагонов отцепить?'
  quantity_carrig = gets.chomp.to_i

  puts "У какого поезда отцепить?\nВыберите номер поезда от 1 до #{quantity}"
  carrig_num = gets.chomp.to_i

  cargo_carrige_delete(quantity_carrig, carrig_num)
end

puts 'Хотите отцепить пассажирские вагоны? (да/нет)?'
yes_or_no = gets.chomp

if yes_or_no == 'да'
  puts 'сколько вагонов отцепить?'
  quantity_carrig = gets.chomp.to_i

  puts "У какого поезда отцепить?\nВыберите номер поезда от 1 до #{quantity}"
  carrig_num = gets.chomp.to_i

  passenger_carrige_delete(quantity_carrig, carrig_num)
end

puts 'Отобразить информацию о вагонах у поездов? (да/нет)?'
yes_or_no = gets.chomp

show_carr if yes_or_no == 'да'

train_add_route

begin
  puts 'Хотите отправить поезда в путь (да/нет)'
  yes_or_no = gets.chomp

  if yes_or_no == 'да'
    puts "сколько из #{@arr_cargo_train.size} грузовых поездов отправить?"
    quantity = gets.chomp.to_i

    go_go_cargo(quantity) if @arr_cargo_train.size <= quantity

    puts "сколько из #{@arr_passenger_train.size} пассажирских поездов отправить?"
    quantity = gets.chomp.to_i

    go_go_passenger(quantity) if @arr_passenger_train.size <= quantity
  end
end while != 'нет'

begin
  puts 'Хотите отправить поезда в обратный путь (да/нет)'
  yes_or_no = gets.chomp

  if yes_or_no == 'да'
    puts "сколько из #{@arr_cargo_train.size} грузовых поездов отправить?"
    quantity = gets.chomp.to_i

    go_back_cargo(quantity) if @arr_cargo_train.size <= quantity

    puts "сколько из #{@arr_passenger_train.size} пассажирских поездов отправить?"
    quantity = gets.chomp.to_i

    go_back_passenger(quantity) if @arr_passenger_train.size <= quantity
  end
end while != 'нет'
