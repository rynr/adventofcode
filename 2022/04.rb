#!/usr/bin/env ruby

# The trick I use is to not just use the values, but to retrieve all the
# sections from the puzzle input. Then the `&` operator on
# [Array](https://ruby-doc.org/current/Array.html) returns all intersecting
# sections of the two arrays.
#
# For the first solution, I check, if the result of all entries of both is the
# same as one of the two arrays.  
# For the 2nd solution, I just check, if there's any intersection.

# [[[2, 3, 4], [6, 7, 8]], [[2, 3], [4, 5]], [[5, 6, 7], [7, 8, 9]], …]
input = (ARGV.empty? ? DATA : ARGF).readlines
  .map { |a| a.split(/,/)                      # Separate Elves
              .map { |b| b.split(/-/)          # Retrieve range borders
                          .map(&:to_i) }
              .map { |d| (d[0]..d[1]).to_a } } # Convert to range and array

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
