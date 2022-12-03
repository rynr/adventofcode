#!/usr/bin/env ruby

# [["R", 5], ["L", 5], ["R", 5], ["R", 3]]
input = (ARGV.empty? ? DATA : ARGF).read.chomp.split(/, /).map { |c| c.split(//) }
input.map { |c| c[1] = c[1].to_i }

META = {
  'N' => [ 0,  1, {'L' => 'W', 'R' => 'E'}],
  'E' => [ 1,  0, {'L' => 'N', 'R' => 'S'}],
  'S' => [ 0, -1, {'L' => 'E', 'R' => 'W'}],
  'W' => [-1,  0, {'L' => 'S', 'R' => 'N'}],
}
goal = input.inject([0, 0, 'N']) { |place, path|
  place[2] = META[place[2]][2][path[0]]
  place[0] = place[0] + META[place[2]][0] * path[1]
  place[1] = place[1] + META[place[2]][1] * path[1]

  place
}

puts "Solution 1: #{goal[0].abs + goal[1].abs}"

__END__
R5, L5, R5, R3
