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

i = -1
games = File.readlines("2-input.txt").reduce([]) do |acc, g|
  i += 1

  round = g.chomp
  they, us = round.split(" ")

  # input = String "C X\n"
  # returns = Int (score, lose/draw/win + suit)
  acc[i] = losewindraw[round] + suits[us] 
  acc
end

puts games.sum
