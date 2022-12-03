#!/usr/bin/env ruby

require 'matrix'

# [[0, 0, 1, 0, 0], [1, 1, 1, 1, 0], [1, 0, 1, 1, 0], [1, 0, 1, 1, 1], …]

data = (ARGV.empty? ? DATA : ARGF)
  .map { |line| line.chomp.split(//) }
  .map { |a| a.map(&:to_i) }

gamma = data.transpose
  .map { |r| r.max_by { |e| r.count(e) } }
  .reverse
  .map.with_index { |d, i| d * 2**i}.sum
epsilon = data.transpose
  .map { |r| r.min_by { |e| r.count(e) } }
  .reverse
  .map.with_index { |d, i| d * 2**i}.sum

puts "Solution 1: #{gamma * epsilon} (#{gamma}, #{epsilon})"

__END__
00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
