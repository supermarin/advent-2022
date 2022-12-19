require 'pry-byebug'
input = File.read('10-input.txt').lines.map(&:chomp)

class CPU
  attr_reader :sum

  def initialize
    @x = 1
    @cycle = 0
    @sum = 0
  end

  def addx(num)
    @x += num.to_i
  end

  def noop(); end

  def cycle
    @cycle += 1
    return unless (@cycle - 20) % 40 == 0

    strength = @cycle * @x
    puts "Cycle: #{@cycle}, X: #{@x}, Signal strength: #{strength}"
    @sum += strength
  end

  def process(instructions)
    until instructions.empty?
      cycle
      instr, arg = instructions.shift.split

      next if instr == 'noop'

      cycle
      addx(arg) if instr == 'addx'
    end
  end
end

cpu = CPU.new
cpu.process(input)
puts "First: #{cpu.sum}"
