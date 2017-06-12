require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new }
  let(:ace1) { Card.new("A", "♣") }
  let(:ace2) { Card.new("A", "♦") }
  let(:king) { Card.new("K", "♥") }
  let(:queen) { Card.new("Q", "♠")}
  let(:jack) { Card.new("J", "♣" )}
  let(:four) { Card.new("4", "♦")}

  describe '#initialize' do
    it 'creates an empty array if no arguments are given' do
      expect(hand.cards).to be_a(Array)
      expect(hand.cards.length).to eq(0)
    end
    
    it 'takes an array of cards as an argument' do
      hand = Hand.new([four, four])
      expect(hand.cards).to be_a(Array)
      expect(hand.cards.length).to eq(2)
    end
  end

  describe '<<' do
    it 'pushes another card into the hand' do
      hand << four
      expect(hand.cards.length).to eq(1)
    end
  end

  describe 'score' do
    it 'gives the total score hand' do
      hand = Hand.new([four, jack])
      expect(hand.score).to eq(14)
    end

    it 'evaluates Ace as 11 if score is less than or equal to 21' do
      hand = Hand.new([ace1, king])
      expect(hand.score).to eq(21)
    end

    it 'evaluates Ace as 1 if score is greater than 21' do
      hand = Hand.new([four, queen, ace2])
      expect(hand.score).to eq(15)
    end

    it 'evaluates multiple Aces correctly' do
      hand = Hand.new([ace1, ace2])
      expect(hand.score).to eq(12)
    end

    it 'evaluates multiple Aces correctly' do
      hand = Hand.new([jack, king, ace1, ace2])
      expect(hand.score).to eq(22)
    end
  end
end
