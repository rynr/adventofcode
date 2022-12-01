#!/usr/bin/env ruby

# [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
input = (ARGV.empty? ? DATA : ARGF).read.split(/\n/).map(&:to_i)

puts "Solution 1: #{input.each_cons(2).filter { |grp| grp[0] < grp[1] }.count}"
puts "Solution 3: #{input.each_cons(3).map(&:sum).each_cons(2).filter { |grp| grp[0] < grp[1] }.count}"

__END__
199
200
208
210
200
207
240
269
260
263
