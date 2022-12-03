# first problem
File.read("1-input.txt").split("\n\n").map { |e| e.split("\n").map(&:to_i).sum }.max
# second problem
File.read("1-input.txt").split("\n\n").map { |e| e.split("\n").map(&:to_i).sum }.sort[-3..].sum
