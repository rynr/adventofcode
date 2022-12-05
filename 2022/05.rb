#!/usr/bin/env ruby

# Preparation takes a bit more effort this time.
stacks, commands = (ARGV.empty? ? DATA : ARGF).read.split(/\n\n/)

# extract Stacks
stacks = stacks.split(/\n/)
stacks.pop
stacks = stacks.map { |row| row.scan(/....?/).map { |c| c[1] } }
stackSize = stacks.map(&:length).max
stacks.map { |s| while s.length < stackSize; s.push nil; end }

# [["N", "Z"], ["D", "C", "M"], ["P"]]
stacks1 = stacks.transpose.compact
stacks2 = stacks.transpose.compact

# extract commands
# [[1, 2, 1], [3, 1, 3], [2, 2, 1], [1, 1, 2]]
commands = commands.chomp
                   .split(/\n/)
                   .map { |c| c.scan(/move (\d+) from (\d+) to (\d+)/)
                               .first
                               .map(&:to_i) }

# Choose which solution you need and uncomment it
commands.each do |count, src, dst|
  # Solution 1
  count.times do
    stacks1[dst-1].unshift stacks1[src-1].shift
  end
  # Solution 2
  stacks2[dst-1].unshift *stacks2[src-1].shift(count)
end

puts "Solution1: #{stacks1.map { |s| s.shift }.join }"
puts "Solution2: #{stacks2.map { |s| s.shift }.join }"

__END__
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
