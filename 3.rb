priorities = (("a".."z").to_a + ("A".."Z").to_a).zip((1..52)).to_h
input = File.readlines("3-input.txt").map { |l| l.chomp.split("") }

result = input.map do |bag|
  a = bag[0...bag.length/2]
  b = bag[bag.length/2...]
  priorities[a.intersection(b)[0]]
end

puts result.sum
