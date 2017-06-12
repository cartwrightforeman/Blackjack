class Card
  attr_reader :value, :suit

  def initialize(value, suit, facedown = false)
    @value = value
    @suit = suit
    @facedown = facedown
  end
end
