# frozen_string_literal: true

require "pry-byebug"
input = File.read("11-input.txt")

class Game
  class << self
    attr_accessor :monkeys
    attr_accessor :common_divisor
  end
end

class Monkey
  attr_reader :id, :items, :inspected_ct, :divisor

  def initialize(input)
    lines = input.lines.map(&:lstrip).map(&:chomp)
    @id = lines.shift.split[1].sub(":", "").to_i
    @items = lines.shift.split(": ")[1].split(", ").map(&:to_i)
    @operation = parse_operation(lines.shift.split("new = ")[1].split)
    @divisor = lines.shift.split("divisible by ")[1].to_i
    @monkey_true, @monkey_false =
      lines.map { |l| l.split("throw to monkey ")[1].to_i }
    @inspected_ct = 0
  end

  def parse_operation(elements)
    numorold = proc { |n, old| n == "old" ? old : n.to_i }
    operators = {
      "*" => proc { |a, b, old| numorold.call(a, old) * numorold.call(b, old) },
      "+" => proc { |a, b, old| numorold.call(a, old) + numorold.call(b, old) }
    }
    a, operator, b = elements
    proc { |old| operators[operator].call(a, b, old) }
  end

  def which_monkey(value)
    value % @divisor == 0 ? @monkey_true : @monkey_false
  end

  def play_round_no_divide
    until @items.empty?
      item = @items.shift
      @inspected_ct += 1

      value = item % Game.common_divisor
      value = @operation.call(value)
      monkey = which_monkey(value)

      Game.monkeys[monkey].items << value
    end
  end

  def play_round
    until @items.empty?
      item = @items.shift
      @inspected_ct += 1

      value = @operation.call(item)
      value /= 3
      monkey = which_monkey(value)

      Game.monkeys[monkey].items << value
    end
  end
end

Game.monkeys = input.split("\n\n").map { |m| Monkey.new(m) }
Game.common_divisor = Game.monkeys.map(&:divisor).reduce(:*)
20.times { Game.monkeys.each(&:play_round) }
most_active = Game.monkeys.sort_by(&:inspected_ct).reverse
puts "First: #{most_active.map(&:inspected_ct)[0..1].reduce(:*)}"

Game.monkeys = input.split("\n\n").map { |m| Monkey.new(m) }
10_000.times { |i| Game.monkeys.each(&:play_round_no_divide) }
most_active = Game.monkeys.sort_by(&:inspected_ct).reverse
puts "Second: #{most_active.map(&:inspected_ct)[0..1].reduce(:*)}"
