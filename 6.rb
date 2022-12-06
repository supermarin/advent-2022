# frozen_string_literal: true

def seqstart(stream, len)
  stream.each_char.with_index do |_, i|
    return i + 1 if
    i > (len - 2) && stream[i - (len - 1)..i].split('').uniq.count == len
  end
end

puts "First: #{seqstart(File.read('6-input.txt'), 4)}"
puts "Second: #{seqstart(File.read('6-input.txt'), 14)}"
