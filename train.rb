class Train
  attr_reader :number, :type

  def initialize(number, *type)
    @number = number
    @type = type
    @speed = 0
    @route
    @arr_stations = []
    @train_now = nil
    @sum = 0
  end

  def type_train
    @type.each { |x| puts x}
  end

  def speed(arg)
    @speed += arg
  end

  def show_speed
    puts @speed
  end

  def stop
    @speed = 0
  end

  def show_carriages
    puts @type[1]
  end

  def show_route(arg = nil)
    if arg && @route
      @route.show_way(@train_now)
    elsif @route
      @route.show_way
    end
  end

  def add_carrig
    if @speed.zero?
      @type[1] += 1
    else
      puts "На ходу нельзя цеплять вагоны!"
    end
  end

  def delete_carrig
    if @type[1].zero?
      puts "Вагонов уже не осталось."
    elsif @speed.zero?
      @type[1] -= 1
    else
      puts "На ходу нельзя отцеплять вагоны!"
    end
  end

  def add_route(route_train)
    @route = route_train
    @route.route.each { |x| @arr_stations << x}
    @arr_stations[0].get_train(self)
    @train_now = @arr_stations[0]
  end

  def go
    if @route.nil?
      puts "У поезда нет маршрута следования."
    elsif @sum == @arr_stations.size - 1
      puts 'Поезд находится на конечной станции'
    else
      @sum += 1
      @train_now.send_train(self)
      @arr_stations[@sum].get_train(self)
      @train_now = @arr_stations[@sum]
    end
  end

  def go_back
    if @route.nil?
      puts "У поезда нет маршрута следования."
    elsif @sum == 0
      puts 'Поезд находится на начальной станции'
    else
      @sum -= 1
      @train_now.send_train(self)
      @arr_stations[@sum].get_train(self)
      @train_now = @arr_stations[@sum]
    end
  end

  def show_where
    puts "Поезд находится на станции: #{@train_now.name}" if @route
  end
end
