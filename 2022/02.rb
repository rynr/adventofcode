#!/usr/bin/env ruby

# [["A", "Y"], ["B", "X"], ["C", "Z"]]
input = (ARGV.empty? ? DATA : ARGF).read.split(/\n/).map { |a| a.split(/ /) }

POINTS_1 = {
  ["A", "X"] => 1 + 3,
  ["B", "X"] => 1 + 0,
  ["C", "X"] => 1 + 6,
  ["A", "Y"] => 2 + 6,
  ["B", "Y"] => 2 + 3,
  ["C", "Y"] => 2 + 0,
  ["A", "Z"] => 3 + 0,
  ["B", "Z"] => 3 + 6,
  ["C", "Z"] => 3 + 3
}
POINTS_2 = {
  ["A", "X"] => 3 + 0,
  ["B", "X"] => 1 + 0,
  ["C", "X"] => 2 + 0,
  ["A", "Y"] => 1 + 3,
  ["B", "Y"] => 2 + 3,
  ["C", "Y"] => 3 + 3,
  ["A", "Z"] => 2 + 6,
  ["B", "Z"] => 3 + 6,
  ["C", "Z"] => 1 + 6
}

puts "Solution 1: #{input.map { |draw| POINTS_1[draw]}.sum}"
puts "Solution 2: #{input.map { |draw| POINTS_2[draw]}.sum}"

__END__
A Y
B X
C Z
