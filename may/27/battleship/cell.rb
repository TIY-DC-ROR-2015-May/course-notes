class Cell
  attr_accessor :ship

  def initialize
    @fired_on = false
  end

  def has_been_fired_on!
    @fired_on = true
    ship.hit! if ship
  end

  def occupied?
    !ship.nil?
  end

  def fired_on?
    @fired_on
  end

  def hit?
    fired_on? && occupied?
  end

  def missed?
    fired_on? && !occupied?
  end
end
