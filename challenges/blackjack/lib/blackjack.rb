require 'pry'
require_relative "card"
require_relative "deck"
require_relative "hand"

player = Hand.new
dealer = Hand.new

deck = Deck.new
2.times do
  dealer << deck.draw
  player << deck.draw
end

puts "Welcome to Blackjack V.9001"
puts "Player was dealt CARD #{player.cards[0].value}#{player.cards[0].suit}"
puts "Player was dealt CARD #{player.cards[1].value}#{player.cards[1].suit}"
puts "Player score: #{player.score}"

while player.score < 22
  if player.score > 21
    puts "BUSTED1!"
    break
  end
  puts "Would you like to Hit or Stand? (H/S)"
  input = gets.chomp.upcase
  if input == 'S'
    puts "Player score: #{player.score}"
    break
  end
  if !['H', 'S'].include?(input)
    puts "Please try again!"
  end
  if input == 'H'
    player << deck.draw
    puts "Player was dealt CARD #{player.cards.last.value}#{player.cards.last.suit}"
    puts "Player score: #{player.score}"
    if player.score > 21
      puts "BUSTED!"
    end
  end
end

if player.score <= 21
  puts "Dealer was dealt CARD #{dealer.cards[0].value}#{dealer.cards[0].suit}"
  puts "Dealer was dealt CARD #{dealer.cards[1].value}#{dealer.cards[1].suit}"
  puts "Dealer score: #{dealer.score}"
  while dealer.score < 17 do
    if dealer.score >= 17
      puts "Dealer stands."
    else
      dealer << deck.draw
      puts "Dealer was dealt CARD #{dealer.cards.last.value}#{dealer.cards.last.suit}"
      puts "Dealer score: #{dealer.score}"
    end
  end
end

if dealer.score > player.score && dealer.score <= 21
  puts "BUSTED!2"
elsif dealer.score > 21 && player.score < 21 || player.score > dealer.score && player.score < 21 && dealer.score > 21 || player.score > dealer.score && player.score < 21 || player.score == 21
  puts "You win!"
elsif dealer.score == player.score && player.score < 21
  puts "Push!"
end
