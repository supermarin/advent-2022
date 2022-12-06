input = File.read('6-input.txt')
def seqstart(stream)
  stream.each_char.with_index do |_, i|
    return i + 1 if i > 2 && stream[i - 3..i].split('').uniq.count == 4
  end
end

def msgstart(stream)
  stream.each_char.with_index do |_, i|
    return i + 1 if i > 12 && stream[i - 13..i].split('').uniq.count == 14
  end
end

puts "First: #{seqstart(input)}"
puts "Seconds: #{msgstart(input)}"
