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

def go_go_cargo(num)
  num.times { |index| @arr_cargo_train[index].go }
end

def go_go_passenger(num)
  num.times { |index| @arr_passenger_train[index].go }
end
