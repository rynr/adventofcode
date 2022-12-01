#!/usr/bin/env ruby

# [[1000, 2000, 3000], [4000], [5000, 6000], [7000, 8000, 9000], [10000]]
input = (ARGV.empty? ? DATA : ARGF).read.split(/\n\n/).map { |a| a.split(/\n/).map(&:to_i) }

puts "Solution 1: #{input.map(&:sum).max}"
puts "Solution 2: #{input.map(&:sum).sort().last(3).sum}"

__END__
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
