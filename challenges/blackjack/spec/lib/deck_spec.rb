require "spec_helper"

RSpec.describe Deck do
  let (:deck) { Deck.new }
  describe '#initialize' do
    it 'has 52 cards' do
      expect(deck.collection.size).to eq(52)
    end
  end

  describe '#shuffle!' do
    it 'shuffles the cards' do
      old_deck = deck.collection.clone
      deck.shuffle!

      expect(old_deck.length).to eq(deck.collection.length)
      expect(old_deck.join).to_not eq(deck.collection.join)
    end
  end

  describe '#draw' do
    context 'pops a card from the deck'

    it 'removes the card' do
      card = deck.draw
      expect(deck.collection.size).to eq(51)
    end

    it 'returns the card' do
      card = deck.draw
      expect(card).to be_a(Card)
    end
  end
end
