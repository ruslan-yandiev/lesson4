class Carrig
  attr_reader :number

  def initialize(number)
    @number = number
    @connection_status = false
  end

  def connect
    @connection_status = true
  end

  def disconnect
    @connection_status = false
  end

  def to_s
    "Тип вагона: #{self.class}, номер: #{number}, соединен ли с поездом: #{@connection_status}, "
  end

  # Методы необходимо инкапсулировать, для того, чтобы их статус мог быть изменен
  # только после присоединения к поезду, а значит доступен только через методы в класса.
  protected :connect, :disconnect
end
