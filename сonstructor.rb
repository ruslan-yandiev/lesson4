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

    # station
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

  def station
    puts 'Укажите минимум две станции:'
    station1 = gets.chomp.capitalize
    @stations[station1] = Station.new(station1)

    station2 = gets.chomp.capitalize
    @stations[station2] = Station.new(station2)

    begin
      puts 'Хотите добавить еще станцию? (да/нет)'
      yes_or_no = gets.chomp

      if yes_or_no == 'да'
        puts 'Укажите название станции:'
        station3 = gets.chomp.capitalize
        @stations[station3] = Station.new(station3)
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

        if  @stations[name1] && @stations[name2]
          @routes[name_route] = Route.new(@stations[name1], @stations[name2])
        else
          puts 'Вы не создавали таких станций'
        end
      end while @stations[name1].nil? && @stations[name2].nil?

      begin
        puts 'Хотите добавить промежуточную станцию? (да/нет)'
        yes_or_no = gets.chomp

        if yes_or_no == 'да'
          puts 'Укажите название станции:'
          name3 = gets.chomp.capitalize
          @routes[name_route].add_stations(@stations[name3]) if @stations[name3]
        end
      end while yes_or_no != 'нет' && yes_or_no != ''

      puts 'Хотите создать новый маршрут? (да/нет)'
      yes_or_no = gets.chomp
    end while yes_or_no != 'нет' && yes_or_no != ''
  end

  def correct_route
    begin
      puts 'Хотите скоректировать какой-то маршрут? (да/нет)'
      yes_or_no = gets.chomp

      if yes_or_no == 'да'
        puts 'Укажите имя маршрута который нужно скоректировать'
        number_route = gets.chomp

        destroy_station(number_route) if  @routes[number_route]
      end
    end while yes_or_no != 'нет' && yes_or_no != ''
  end

  def create_train
    puts 'Сколько грузовых и товарных поездов создать?'
    @quantity2 = gets.chomp.to_i

    @cargo_trains = []
    @passenger_trains = []

    1.upto(@quantity2) do |number|
      @cargo_trains << CargoTrain.new(number)

      @passenger_trains << PassengerTrain.new(number)
    end
  end

  def create_carrig
    puts 'Сколько грузовых и товарных вагонов создать?'
    @quantity = gets.chomp.to_i


    1.upto(@quantity) do |number|
      @f_carrigs << FreightCarrig.new(number, 5000)

      @p_carrigs << PassengerCarrig.new(number, 100)
    end
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

  def argo_carrige_delete!
    puts 'Хотите отцепить товарные вагоны? (да/нет)?'
    yes_or_no = gets.chomp

    if yes_or_no == 'да'
      puts 'сколько вагонов отцепить?'
      quantity_carrig = gets.chomp.to_i

      puts "У какого поезда отцепить?\nВыберите номер поезда от 1 до #{@quantity2}"
      carrig_num = gets.chomp.to_i

      cargo_carrige_delete(quantity_carrig, carrig_num) if quantity_carrig <= @quantity && carrig_num <= @quantity2
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

  def destroy_station(number_route)
    puts "Какую станцию из маршрута: #{number_route} хотите удалит?"
    @routes[number_route].show_way

    puts 'Введите название станции:'
    name_station = gets.chomp
    @routes[number_route].delete_way(@stations[name_station]) if @stations[name_station]
  end

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
