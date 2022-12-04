suits = {
  "A" => 1, # rock
  "X" => 1, # rock
  "B" => 2, # paper
  "Y" => 2, # paper
  "C" => 3, # scissor
  "Z" => 3, # scissor
}

losewindraw = { 
  "A Y" => 6,
  "A Z" => 0,
  "B Z" => 6,
  "B X" => 0,
  "C X" => 6,
  "C Y" => 0,

  "A X" => 3,
  "B Y" => 3,
  "C Z" => 3,
}

scores_2 = {
  "X" => 0, # lose
  "Y" => 3, # draw
  "Z" => 6, # win
}

our_suit = { 
  "A X" => "C",
  "A Y" => "A",
  "A Z" => "B",
  "B X" => "A",
  "B Y" => "B",
  "B Z" => "C",
  "C X" => "B",
  "C Y" => "C",
  "C Z" => "A",
}

input = File.readlines("2-input.txt")

i = -1
games = input.reduce([]) do |acc, g|
  i += 1
  round = g.chomp # g = String "C X\n"
  they, us = round.split(" ")
  acc[i] = losewindraw[round] + suits[us] 
  acc
end
puts "First: #{games.sum}"

i = -1
games_2 = input.reduce([]) do |acc, g|
  i += 1
  round = g.chomp # g = String "C X\n"
  they, outcome = round.split(" ")
  us = our_suit[round]
  acc[i] = scores_2[outcome] + suits[us] 
  acc
end
puts "Second: #{games_2.sum}"
