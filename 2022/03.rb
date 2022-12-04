#!/usr/bin/env ruby

# https://adventofcode.com/2022/day/4

# Adding the method `halves` to `String` to split it in two halfes
class String
  def halves
    chars.each_slice(size / 2).map(&:join)
  end
end
# Using a string to get the points of any character by `POINTS.index(<char>)`
POINTS = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

# ["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", …]
input = (ARGV.empty? ? DATA : ARGF).read.split(/\n/)

solution1 =  input.map { |a| a.halves.map { |b| b.split(//) } } # get halfs
  .map { |a, b| a.intersection(b) }                             # intersect
  .flatten
  .map { |a| POINTS.index(a) }
  .sum
solution2 =  input.each_slice(3)                       # get every 3 rucksacks
  .map { |a| a.map { |b| b.split(//) } }               # split contents
  .map { |a, b, c| a.intersection(b).intersection(c) } # intersect all 3 contents
  .flatten
  .map { |a| POINTS.index(a) }
  .sum

puts "Solution 1: #{solution1}"
puts "Solution 2: #{solution2}"

__END__
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
