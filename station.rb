class Station
  attr_reader :name, :train

  def initialize(name)
    @name = name
    @trains = []
  end

  def get_train(train)
    @trains << train
    puts "На станцию #{name} прибыл #{train.number}"
  end

  def show_trains_info(type = nil)
    if type
      @trains.each { |train| puts "number train: #{train.number}, type of train: #{train.type[0]}, вагонов: #{train.type[1]}" }
    else
      @trains.each { |train| puts train.number }
    end
  end

  def send_train(train)
    puts "Со станции #{name} отправился #{train.number}"
    @trains.delete(train)
  end
end
