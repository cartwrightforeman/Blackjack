require "spec_helper"

RSpec.describe Card do
  let(:card) { Card.new("A", "♠") }

  describe "#initialize" do
    it 'takes a value and suit' do
      expect(card).to be_a(Card)
    end
  end
  
  describe "value" do
    it 'has "A" as the value' do
      expect(card.value).to eq('A')
    end
  end

  describe "suit" do
    it 'has "♠" as the suit' do
      expect(card.suit).to eq('♠')
    end
  end
end
