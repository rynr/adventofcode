#!/usr/bin/env ruby

# [[["2", "3", "4"], ["6", "7", "8"]], [["2", "3"], ["4", "5"]], …]
input = (ARGV.empty? ? DATA : ARGF).read
  .split(/\n/)
  .map { |a| a.split(/,/).map { |b| b.split(/-/).map(&:to_i) }.map { |d| (d[0]..d[1]).to_a } }

solution1 = input.filter { |a, b| [a, b].include?(a & b) }.size
solution2 = input.filter { |a, b| (a & b).any? }.size

puts "Solution 1: #{solution1}"
puts "Solution 2: #{solution2}"

__END__
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
