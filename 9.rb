# frozen_string_literal: false

require 'set'
require 'pry-byebug'

input = File.read('9-input.txt').lines.map(&:chomp)
moves = input.map(&:split)
deltas = {
  'U' => [0, 1],
  'D' => [0, -1],
  'L' => [-1, 0],
  'R' => [1, 0]
}

def calculate_delta(head, tail)
  dx = head[0] - tail[0]
  dy = head[1] - tail[1]
  return [0, 0] if dx.abs < 2 && dy.abs < 2
  return [dx - 1, dy - 1] if dx == 2 && dy == 2
  return [dx + 1, dy + 1] if dx == - 2 && dy == - 2
  return [dx - 1, dy + 1] if dx == 2 && dy == - 2
  return [dx + 1, dy - 1] if dx == - 2 && dy == 2
  return [dx - 1, dy] if dx == 2
  return [dx + 1, dy] if dx == -2
  return [dx, dy - 1] if dy == 2
  return [dx, dy + 1] if dy == - 2
end

snake = [
  [0, 0],
  [0, 0],
  [0, 0],
  [0, 0],
  [0, 0],
  [0, 0],
  [0, 0],
  [0, 0],
  [0, 0],
  [0, 0]
]

def resolve(moves, deltas, snake)
  visited = Set.new([0, 0])
  moves.each do |m|
    delta = deltas[m[0]]
    n = m[1].to_i

    n.times do |_i|
      (0...snake.count).each do |piece|
        if piece == 0
          before = snake[piece].dup
          snake[piece][0] += delta[0]
          snake[piece][1] += delta[1]
          next
        end

        dx, dy = calculate_delta(snake[piece - 1], snake[piece])
        snake[piece][0] += dx
        snake[piece][1] += dy
        visited.add(snake[piece]) if piece == snake.count - 1
      end
    end
  end
  visited
end

puts "First: #{resolve(moves, deltas, [[0, 0], [0, 0]]).count}"
puts "Second: #{resolve(moves, deltas, snake).count}"
