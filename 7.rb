# frozen_string_literal: true

F = Struct.new(:path, :size)
class D < Struct.new(:path, :parent, :entries) 
  def size = entries.map(&:size).reduce(:+)
  def traverse
    dirs = entries.filter {|e| e.class == D}
    children = dirs.map(&:traverse)
    dirs + children.flatten
  end
end

input = File.readlines('7-input.txt').map(&:chomp)
root = D.new('/', nil, [])
cwd = root
shell = {
  %r{^\$ cd /} => proc { cwd = root },
  /^\$ cd \.\./ => proc { cwd = cwd.parent || root },
  /^\$ cd (\w+)/ => proc { |dir| cwd = cwd.entries.find {|e| File.basename(e.path) == dir }},
  /^(\d+) (\w+)/ => proc { |size, f| cwd.entries << F.new(File.join(cwd.path, f), size.to_i) },
  /^dir (\w+)/ => proc { |dir| cwd.entries << D.new(File.join(cwd.path, dir), cwd, []) },
  /^\$ ls/ => proc { } # noop
}

input.each do |line|
  cmd, m = shell.keys.map do |k|
    m = k.match(line)
    [k, m] if m
  end.compact.flatten
  shell[cmd].call(*m.captures)
end

dirs = root.traverse
puts "First: #{dirs.filter {|d| d.size < 100000}.map(&:size).sum}"

disk_size = 70000000
update = 30000000
free = disk_size - root.size
needed = update - free
delete = dirs.sort_by(&:size).find { |d| d.size > needed }.size
puts "Second: #{delete}"
