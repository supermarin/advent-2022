# frozen_string_literal: true

input = File.read('8-input.txt')

grid = input.lines.map { |l| l.chomp.split('').map(&:to_i) }
nbors = []
visible = grid.map.with_index do |row, i|
  row.map.with_index do |tree, j|
    exterior = i == 0 || i == grid.count - 1 || j == 0 || j == row.count - 1

    l = row[0...j]
    r = row[j + 1..]
    u = grid[0...i].map { |g| g[j] }
    d = grid[i + 1..].map { |g| g[j] }

    exterior || l.max < tree || r.max < tree || u.max < tree || d.max < tree
  end
end
puts "First: #{visible.flatten.filter { |t| t == true }.count}"

scores = grid.map.with_index do |row, i|
  row.map.with_index do |tree, j|
    exterior = i == 0 || i == grid.count - 1 || j == 0 || j == row.count - 1

    l = row[0...j].reverse
    r = row[j + 1..]
    u = grid[0...i].map { |g| g[j] }.reverse
    d = grid[i + 1..].map { |g| g[j] }

    [u, l, d, r].reduce([]) do |acc, trees|
      untilblocked = []
      trees.each do |t|
        untilblocked << t
        break if t >= tree
      end
      acc << untilblocked
    end.map(&:count).reduce(:*)
  end
end
puts "Second: #{scores.flatten.max}"
