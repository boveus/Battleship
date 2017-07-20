require 'simplecov'
SimpleCov.start

class Ship

  attr_reader     :length,
                  :orientation,
                  :health

  def initialize(length, orientation)
    @length = length
    @orientation = orientation
    @health = length
  end

  def hit
    @health -= 1
  end

  def is_sunken?
    @health == 0
  end
end
