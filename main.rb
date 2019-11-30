require_relative 'carrig'
require_relative 'freight_carrig'
require_relative 'passenger_carrig'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'station'
require_relative 'route'

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

def station
  puts 'Укажите минимум две станции:'
  station1 = gets.chomp.capitalize
  @hh_station[station1] = Station.new(station1)

  station2 = gets.chomp.capitalize
  @hh_station[station2] = Station.new(station2)

  begin
    puts 'Хотите добавить еще станцию? (да/нет)'
    yes_or_no = gets.chomp

    if yes_or_no == 'да'
      puts 'Укажите название станции:'
      station3 = gets.chomp.capitalize
      @hh_station[station3] = Station.new(station3)
    end
  end while yes_or_no != 'нет' && yes_or_no != ''
end

def route
  begin
    begin
      puts "Необходимо составить маршрут следования. Какие станции из созданных вы хотите добавить в маршрут?"

      puts 'Дайте имя или присвойте номер маршруту'
      name_route = gets.chomp

      puts 'Укажите начальную станцию:'
      name1 = gets.chomp.capitalize

      puts 'Укажите конечную станцию:'
      name2 = gets.chomp.capitalize

      if  @hh_station[name1] && @hh_station[name2]
        @hh_route[name_route] = Route.new(@hh_station[name1], @hh_station[name2])
      else
        puts 'Вы не создавали таких станций'
      end
    end while @hh_station[name1].nil? && @hh_station[name2].nil?

    begin
      puts 'Хотите добавить промежуточную станцию? (да/нет)'
      yes_or_no = gets.chomp

      if yes_or_no == 'да'
        puts 'Укажите название станции:'
        name3 = gets.chomp.capitalize
        @hh_route[name_route].add_stations(@hh_station[name3]) if @hh_station[name3]
      end
    end while yes_or_no != 'нет' && yes_or_no != ''

    puts 'Хотите создать новый маршрут? (да/нет)'
    yes_or_no = gets.chomp
  end while yes_or_no != 'нет' && yes_or_no != ''
end

def destroy_station(number_route)
  puts "Какую станцию из маршрута: #{number_route} хотите удалит?"
  @hh_route[number_route].show_way

  puts 'Введите название станции:'
  name_station = gets.chomp
  @hh_route[number_route].delete_way(@hh_station[name_station]) if @hh_station[name_station]
end

def connect_carrig
  @arr_cargo_train.each do |train|
    @arr_f.each { |carrig| train.add_carrig(carrig) }
  end

  @arr_passenger_train.each do |train|
    @arr_p.each { |carrig| train.add_carrig(carrig) }
  end
end

def show_carr
  @arr_cargo_train.each do |train|
    train.show_carriages
  end

  @arr_passenger_train.each do |train|
    train.show_carriages
  end
end

def cargo_carrige_delete(carrig_cum, train_num)
  carrig_cum.times { @arr_cargo_train[train_num - 1].delete_carrig }
end

def passenger_carrige_delete(carrig_cum, train_num)
  carrig_cum.times { @arr_passenger_train[train_num - 1].delete_carrig }
end

def go_go_cargo(num)
  num.times { |index| @arr_cargo_train[index].go }
end

def go_go_passenger(num)
  num.times { |index| @arr_passenger_train[index].go }
end

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


def train_add_route
  puts 'необходимо назначить путь поездам'

  @arr_cargo_train.each.with_index(1) do |train, index|
    puts "Укажите путь для #{index}-го грузового поезда"
    route = gets.chomp

    train.add_route(@hh_route[route]) if @hh_route[route]
  end

  @arr_passenger_train.each.with_index(1) do |train, index|
    puts "Укажите путь для #{index}-го пассажирского поезда"
    route = gets.chomp

    train.add_route(@hh_route[route]) if @hh_route[route]
  end
end

train_add_route

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

# @arr_cargo_train = []
# @arr_passenger_train = []
# @hh_route = {}

# cargo_train.add_route(route1)
# passenger_train.add_route(route1)

# station1.show_trains_info

# cargo_train.speed = 150
# cargo_train.show_speed
# cargo_train.stop
# cargo_train.show_speed

# cargo_train.go
# cargo_train.speed = 150
# cargo_train.show_speed

# station1.show_trains_info

# cargo_train.go
# cargo_train.go_back
# cargo_train.show_where

# cargo_train.delete_carrig
# cargo_train.stop
# cargo_train.delete_carrig
# cargo_train.show_carriages

# cargo_train.show_route

