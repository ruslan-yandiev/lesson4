class Carrig
  attr_reader :number

  def initialize(number)
    @number = number
    @status = false
  end

  def change_status(train)
    if train.carrig.include?(self)
      connect
    else
      disconnect
    end
  end

  def connect
    @status = true
  end

  def disconnect
    @status = false
  end

  def to_s
    "Тип вагона: #{self.class}, номер: #{number}, соединен ли с поездом: #{@status}, "
  end

  # Методы необходимо инкапсулировать, для того, чтобы их статус мог быть изменен
  # только после присоединения к поезду, а значит доступен только через методы в класса.
  protected :connect, :disconnect
end
