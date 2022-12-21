# frozen_string_literal: true

require 'pry-byebug'

input = File.read('11-input.txt')

class Game
  class << self
    attr_accessor :monkeys
  end
end

class Monkey
  attr_reader :id, :items, :inspected_ct

  def initialize(input)
    lines = input.lines.map(&:lstrip).map(&:chomp)
    @id = lines.shift.split[1].sub(':', '').to_i
    @items = lines.shift.split(': ')[1].split(', ').map(&:to_i)
    @operation = parse_operation(lines.shift.split(': ')[1])
    @divisor = lines.shift.split('divisible by ')[1].to_i
    @monkey_true, @monkey_false = lines.map { |l| l.split('throw to monkey ')[1].to_i }
    @inspected_ct = 0
  end

  def parse_operation(input)
    numorold = proc do |n, old|
      n == 'old' ? old : n.to_i
    end
    operators = {
      '*' => proc { |a, b, old| numorold.call(a, old) * numorold.call(b, old) },
      '+' => proc { |a, b, old| numorold.call(a, old) + numorold.call(b, old) }
    }
    a, operator, b = input.split(' = ')[1].split
    proc { |old|
      operators[operator].call(a, b, old)
    }
  end

  def worry_level(item)
    @operation.call(item)
  end

  def which_monkey(item)
    item % @divisor == 0 ? @monkey_true : @monkey_false
  end

  def play_round(divide: 3)
    until @items.empty?
      # inspect
      item = @items.shift
      item = worry_level(item)
      @inspected_ct += 1

      # divide worry by 3
      item /= divide

      # check if divisible by number and throw to the right monkey
      monkey = which_monkey(item)
      Game.monkeys[monkey].items << item
    end
  end
end

Game.monkeys = input.split("\n\n").map { |m| Monkey.new(m) }
20.times do
  Game.monkeys.each { |m| m.play_round(divide: 3) }
end

most_active = Game.monkeys.sort_by(&:inspected_ct).reverse
puts "First: #{most_active.map(&:inspected_ct)[0..1].reduce(:*)}"

Game.monkeys = input.split("\n\n").map { |m| Monkey.new(m) }
10000.times do
  Game.monkeys.each { |m| m.play_round(divide: 1) }
end

most_active = Game.monkeys.sort_by(&:inspected_ct).reverse
puts Game.monkeys.map { |m| "Monkey #{m.id}: #{m.inspected_ct}" }
puts "Second: #{most_active.map(&:inspected_ct)[0..1].reduce(:*)}"
