def calculate_total(cards) 
  
  hands_array = cards.map{|e| e[1] }

  total = 0
  hands_array.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for Aces
  hands_array.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end


puts "Let's play some Blackjack!"
puts ""
puts "What's your name?"
playername = gets.chomp.capitalize

response = "Y"

while response == "Y"

suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

# Deal Cards

player_cards = []
dealer_cards = []

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

dealertotal = calculate_total(dealer_cards)
playertotal = calculate_total(player_cards)


puts "The dealer has #{dealer_cards[1]} showing."
puts ""
puts "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of: #{playertotal}"
puts ""

if playertotal == 21 && dealertotal < 21
   puts "Congratulations. You got Blackjack."
end   

if dealertotal == 21 and playertotal < 21
  puts "Sorry.  The dealer has Blackjack."
end

 while playertotal < 21  
  puts playername  
  puts "What would you like to do? 1) hit 2) stay"
        hit_or_stay = gets.chomp

    if  hit_or_stay == '2'
        puts "You have stayed."
        break
    end

player_cards << deck.pop
playertotal = calculate_total(player_cards)
puts "Now you have: #{playertotal}"

  if  playertotal > 21
      puts "Sorry. You busted"
  end
end 

if dealertotal >= 17 
 puts "The dealer has: #{dealertotal}." 
end

  while dealertotal < 17 && playertotal < 22
    dealer_cards << deck.pop
    dealertotal = calculate_total(dealer_cards)
    puts "The dealer has: #{dealertotal}."
     

  if dealertotal > 21
      puts "The dealer busted with #{dealertotal}. You win."
  end
end



if playertotal > dealertotal  && playertotal <= 21
    puts "Congratulations, #{playername}.  You win."
end

if playertotal < dealertotal and dealertotal <= 21
    puts "Sorry.  You lost."
end

if playertotal == dealertotal
    puts "It's a push."
end

puts "Do you want to play again?  Y/N"
response = gets.chomp.upcase

end





     

