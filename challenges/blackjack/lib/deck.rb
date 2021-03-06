require_relative 'card'

SUITS = %w(♠ ♥ ♦ ♣)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

class Deck
  attr_reader :collection

  def initialize()
    @collection = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @collection << Card.new(value, suit)
      end
    end
    shuffle!
  end

  def shuffle!
    @collection.shuffle!
  end

  def draw
    @collection.pop
  end
end
