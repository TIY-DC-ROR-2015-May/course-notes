class Ship
  attr_reader :name, :length, :health

  def initialize name, length
    @name, @length = name, length
    @health = length
  end

  def hit!
    @health -= 1
    if @health == 0
      `say "You sunk my #{@name}"` unless ENV["SILENT_RUNNING"]
    end
  end

  def sunk?
    @health <= 0
  end
end
