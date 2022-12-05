# frozen_string_literal: true

require 'strscan'

input = File.read('5-input.txt')
cs, moves = input.split("\n\n").map { |l| l.split("\n") }
crates = cs[0...-1]

# maps the array index to stack number
# {1=>"1", 5=>"2", 9=>"3", 13=>"4", 17=>"5", 21=>"6", 25=>"7", 29=>"8", 33=>"9"}
revstacks = cs[-1].chars.each_with_object({}).with_index do |(c, a), i|
  a[i] = c if c.to_i != 0
end

stacks = crates.each_with_object({}) do |row, acc|
  row.chars.each_with_index do |c, i|
    (acc[revstacks[i]] ||= []).unshift(c) if c =~ /\w/
  end
  acc
end

moved = moves.each_with_object(stacks) do |move, acc|
  scanner = StringScanner.new(move)
  scanner.scan(/move (\d+) from (\d) to (\d)/)
  howmany, from, to = scanner.captures
  taken = acc[from].pop(howmany.to_i)
  taken.reverse.map { |e| acc[to] << e }
  acc
end

puts "First: #{moved.keys.sort.map { |k| moved[k].last }.join}"
