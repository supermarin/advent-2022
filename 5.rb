# frozen_string_literal: true

require 'strscan'

def stacks_and_moves
  input = File.read('5-input.txt')
  crates, moves = input.split("\n\n").map { |l| l.split("\n") }
  # {1=>"1", 5=>"2", 9=>"3", 13=>"4", 17=>"5", 21=>"6", 25=>"7", 29=>"8", 33=>"9"}
  revstacks = crates[-1].chars.each_with_object({}).with_index do |(c, a), i|
    a[i] = c if c.to_i != 0
  end

  stacks = crates[0...-1].each_with_object({}) do |row, acc|
    row.chars.each_with_index do |c, i|
      (acc[revstacks[i]] ||= []).unshift(c) if c =~ /\w/
    end
  end
  [stacks, moves]
end

s, m = stacks_and_moves
moved = m.each_with_object(s) do |move, acc|
  scanner = StringScanner.new(move)
  scanner.scan(/move (\d+) from (\d) to (\d)/)
  howmany, from, to = scanner.captures
  taken = acc[from].pop(howmany.to_i)
  taken.reverse.map { |e| acc[to] << e }
end
puts "First: #{moved.keys.sort.map { |k| moved[k].last }.join}"

s, m = stacks_and_moves
moved2 = m.each_with_object(s) do |move, acc|
  scanner = StringScanner.new(move)
  scanner.scan(/move (\d+) from (\d) to (\d)/)
  howmany, from, to = scanner.captures
  taken = acc[from].pop(howmany.to_i)
  taken.map { |e| acc[to] << e }
end
puts "Second: #{moved2.keys.sort.map { |k| moved2[k].last }.join}"
