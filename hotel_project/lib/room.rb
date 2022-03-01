class Room

    attr_reader :capacity, :occupants

  def initialize(num)
    @capacity = num
    @occupants = []
    
  end

  def full?

    @occupants.length >= @capacity
  end

  def available_space

    capacity - @occupants.length
  end

  def add_occupant(str)

    if full?
        return false
    else
        @occupants << str
        return true
    end
  end
end