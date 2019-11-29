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
end
