require_relative 'card'

class Hand
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def <<(card)
    @cards << card
  end

  def score
    elevens = 0
    total_score = 0

    @cards.each do |card|
      case card.value
      when "J", "Q", "K"
        total_score += 10
      when "A"
        elevens += 1
        total_score += 11
      else
        total_score += card.value.to_i
      end
    end

    while total_score > 21 && elevens > 0 do
      total_score -= 10
      elevens -= 1
    end

    return total_score
  end
end
