input = File.read('10-input.txt').lines.map(&:chomp)

class CRT
  attr_reader :screen

  def initialize
    @screen = []
  end

  def draw(cycle, x)
    c = cycle - 1
    row = c / 40
    col = c % 40
    @screen[row] ||= []
    @screen[row][col] = if (x - 1..x + 1).include?(col)
                          '#'
                        else
                          '.'
                        end
  end
end

class CPU
  attr_reader :sum

  def initialize(crt)
    @x = 1
    @cycle = 0
    @sum = 0
    @crt = crt
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
      @crt.draw(@cycle, @x)
      instr, arg = instructions.shift.split

      next if instr == 'noop'

      cycle
      @crt.draw(@cycle, @x)
      addx(arg) if instr == 'addx'
    end
  end
end

crt = CRT.new
cpu = CPU.new(crt)
cpu.process(input)
puts "First: #{cpu.sum}"
puts "Second:\n#{crt.screen.map(&:join).join("\n")}"
