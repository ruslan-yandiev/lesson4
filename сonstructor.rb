class Сonstructor
  attr_reader :collection, :stations, :routes, :cargo_trains, :passenger_trains, :f_carrigs, :p_carrigs

  def initialize
    @collection = [Station, Route, CargoTrain, PassengerTrain, FreightCarrig, PassengerCarrig]
    @stations = []
    @routes = []
    @cargo_trains = []
    @passenger_trains = []
    @f_carrigs = []
    @p_carrigs = []
  end

  def constructor(number, amount)
    amount.times do |index|
      if @collection[number].nil?
        puts 'Вы неверно указали номер!!!'
      elsif @collection[number].new.instance_of? Station
        object = @collection[number].new
        object.name!
        @stations << object
      elsif  @collection[number].new.instance_of? Route
        object = @collection[number].new
        object.name!
        @routes << object
      elsif  @collection[number].new.instance_of? CargoTrain
        object = @collection[number].new
        object.number!(index)
        @cargo_trains << object
      elsif  @collection[number].new.instance_of? PassengerTrain
        object = @collection[number].new
        object.number!(index)
        @passenger_trains << object
      elsif  @collection[number].new.instance_of? FreightCarrig
        object = @collection[number].new
        object.number!(index)
        @f_carrigs << object
      elsif  @collection[number].new.instance_of? PassengerCarrig
        object = @collection[number].new
        object.number!(index)
        @p_carrigs << object
      end
    end

    @collection.delete_at(number)
  end

  def start
    puts 'Выберите из списка:'

    #  route
    # create_carrig
    #  create_train


    # connect_carrig!
    # correct_route
    # show_carr!
    # argo_carrige_delete!
    # passenger_carrige_delete!
    # train_add_route
    # go_go
    # go_back
  end

  def route
    begin
      puts "Необходимо составить маршрут следования и добавить станции к созданным маршрутам.\nКакие станции из созданных вы хотите добавить в маршрут?"

      begin
        @routes.each_with_index do |type, index|
          puts "\t#{index}. Маршрут: #{type.name}"
        end
        puts 'Выберите маршрут:'
        number_r = gets.chomp.to_i

        puts 'Неверно выбран маршрут!!!' unless @routes[name_r]
      end while @routes[name_r] != true

      begin
        @stations.each_with_index do |type, index|
          puts "\t#{index}. Станция: #{type.name}"
        end

        puts "Укажите номер станции.\nСтанции будут добавляться по порядку, от начальной и до конечной."
        number_s = gets.chomp.to_i

        if @routes[name_r] && @stations[number_s] && @routes[name_r].include?(@stations[number_s]) == false
          @routes[name_r].add_stations(@stations[number_s])
        else
          puts 'Неверно указана станция!!!'
        end

        puts 'Хотите добавить еще станцию? (да/нет)'
        yes_or_no = gets.chomp
      end while yes_or_no != 'нет' && yes_or_no != ''

      puts 'Хотите создать новый маршрут? (да/нет)'
      yes_or_no = gets.chomp
    end while yes_or_no != 'нет' && yes_or_no != ''
  end

  def correct_route
    begin
      puts 'Хотите скоректировать маршрут? (да/нет)'
      yes_or_no = gets.chomp

      if yes_or_no == 'да'
        begin
          @routes.each_with_index do |type, index|
            puts "\t#{index}. Маршрут: #{type.name}"
          end

          puts 'Выберите маршрут для коррекции:'
          number_r = gets.chomp.to_i

          puts 'Неверно выбран маршрут!!!' unless @routes[name_r]
        end while @routes[name_r] != true

        begin
          @routes[name_r].route.each_with_index do |type, index|
            puts "\t#{index}. Станция: #{type.name}"
          end

          print "Укажите номер станции которую нужно удалить:"
          number_s = gets.chomp.to_i

          if @routes[name_r].route.include?(@routes[name_r].route[number_s])
            @routes[name_r].route.delete_way(number_s)
          else
            puts 'Неверно указана станция!!!'
          end

          puts 'Хотите удалить еще станцию? (да/нет)'
          yes_or_no = gets.chomp
        end while yes_or_no != 'нет' && yes_or_no != ''
      end
    end while yes_or_no != 'нет' && yes_or_no != ''
  end

  def connect_carrig!
    puts 'Присоединить к созданным поездам имеющиеся вагоны? (да/нет)?'
    yes_or_no = gets.chomp

    connect_carrig if yes_or_no == 'да'
  end

  def show_carr!
    puts 'Отобразить информацию о вагонах у поездов? (да/нет)?'
    yes_or_no = gets.chomp

    show_carr if yes_or_no == 'да'
  end

  def cargo_carrige_delete!
    puts 'Хотите отцепить товарные вагоны? (да/нет)?'
    yes_or_no = gets.chomp

    if yes_or_no == 'да'
      puts 'сколько вагонов отцепить?'
      quantity_carrig = gets.chomp.to_i

      puts "У какого поезда отцепить?\nВыберите номер поезда:"
      @cargo_trains.each_with_index {|train, index| puts "#{index}. Поезд:#{train.number}"}
      train_num = gets.chomp.to_i

      cargo_carrige_delete(quantity_carrig, train_num) if cargo_trains[train_num] && cargo_trains[train_num].carrig.size <= quantity_carrig
    end
  end

  def passenger_carrige_delete!
    puts 'Хотите отцепить пассажирские вагоны? (да/нет)?'
    yes_or_no = gets.chomp

    if yes_or_no == 'да'
      puts 'сколько вагонов отцепить?'
      quantity_carrig = gets.chomp.to_i

      puts "У какого поезда отцепить?\nВыберите номер поезда от 1 до #{@quantity2}"
      carrig_num = gets.chomp.to_i

      passenger_carrige_delete(quantity_carrig, carrig_num) if quantity_carrig <= @quantity && carrig_num <= @quantity2
    end
  end

  def train_add_route
    puts 'необходимо назначить путь поездам'

    @cargo_trains.each.with_index(1) do |train, index|
      puts "Укажите путь для #{index}-го грузового поезда"
      route = gets.chomp

      train.add_route(@routes[route]) if @routes[route]
    end

    @passenger_trains.each.with_index(1) do |train, index|
      puts "Укажите путь для #{index}-го пассажирского поезда"
      route = gets.chomp

      train.add_route(@routes[route]) if @routes[route]
    end
  end

  def go_go
    begin
      puts 'Хотите отправить поезда в путь (да/нет)'
      yes_or_no = gets.chomp

      if yes_or_no == 'да'
        go_go_cargo(@cargo_trains.size)
        go_go_passenger(@passenger_trains.size)
      end
    end while yes_or_no != 'нет'
  end

  def go_back
    begin
      puts 'Хотите отправить поезда в обратный путь (да/нет)'
      yes_or_no = gets.chomp

      if yes_or_no == 'да'
        go_back_cargo(@cargo_trains.size)
        go_back_passenger(@passenger_trains.size)
      end
    end while yes_or_no != 'нет'
  end

  protected

  def connect_carrig
    @cargo_trains.each do |train|
      @f_carrigs.each { |carrig| train.add_carrig(carrig) }
    end

    @passenger_trains.each do |train|
      @p_carrigs.each { |carrig| train.add_carrig(carrig) }
    end
  end

  def show_carr
    @cargo_trains.each do |train|
      train.show_carriages
    end

    @passenger_trains.each do |train|
      train.show_carriages
    end
  end

  def cargo_carrige_delete(carrig_cum, train_num)
    carrig_cum.times { @cargo_trains[train_num - 1].delete_carrig }
  end

  def passenger_carrige_delete(carrig_cum, train_num)
    carrig_cum.times { @passenger_trains[train_num - 1].delete_carrig }
  end

  def go_go_cargo(num)
    num.times { |index| @cargo_trains[index].go }
  end

  def go_go_passenger(num)
    num.times { |index| @passenger_trains[index].go }
  end

  def go_back_cargo(num)
    num.times { |index| @cargo_trains[index].go_back }
  end

  def go_back_passenger(num)
    num.times { |index| @passenger_trains[index].go_back }
  end
end
