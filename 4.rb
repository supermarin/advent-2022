# frozen_string_literal: true

input = File.readlines('4-input.txt')

result = input.reduce(0) do |acc, l|
  l, r = l.chomp.split(',').map { |r| r.split('-').map(&:to_i) }
  acc += 1 if (l[0] >= r[0] && l[1] <= r[1]) || (r[0] >= l[0] && r[1] <= l[1])
  acc
end
puts "First: #{result}"

result2 = input.reduce(0) do |acc, l|
  l, r = l.chomp.split(',').map { |r| r.split('-').map(&:to_i) }
  acc += 1 if (r[0] <= l[1] && r[1] >= l[0]) || (l[0] <= r[1] && l[1] >= r[0])
  acc
end
puts "Second: #{result2}"
