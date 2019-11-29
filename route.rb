class Route
  attr_accessor :route

  def initialize(starting, final)
    @route = [starting, final]
  end

  def add_stations(*new_route)
    new_route.each { |route| @route.insert(-2, route) }
  end

  def delete_way(way)
    @route.delete(way)
  end

  def show_way(name_station = nil)
    if name_station
      num = @route.index(name_station)
      puts "Вы покинули станцию #{@route[num -1].name},\nСейчас находитесь на станции #{@route[num].name}\nСледующая остановка #{@route[num + 1].name}"
    else
      @route.each { |x| puts x.name }
    end
  end
end
