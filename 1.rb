# frozen_string_literal: true

input = File.read('1-input.txt').split("\n\n")
puts "First: #{input.map { |e| e.split("\n").map(&:to_i).sum }.max}"
puts "Second: #{input.map { |e| e.split("\n").map(&:to_i).sum }.sort[-3..].sum}"
