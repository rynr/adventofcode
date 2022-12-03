#!/usr/bin/env ruby

data = (ARGV.empty? ? DATA : ARGF)
  .map { |line| line.chomp.split(/ /) }
  .map { |a| a[1] = a[1].to_i; a }.to_a

position = [0, 0]

data.each do |c|
  case c[0]
  when 'forward'
    position[0] += c[1]
  when 'down'
    position[1] += c[1]
  when 'up'
    position[1] -= c[1]
  end
end

puts "Solution 1: #{position.inject(:*)}"

position = [0, 0, 0]

data.each do |c|
  case c[0]
  when 'forward'
    position[0] += c[1]
    position[1] += c[1] * position[2]
  when 'down'
    position[2] += c[1]
  when 'up'
    position[2] -= c[1]
  end
end

puts "Solution 2: #{position[0] * position[1]}"

__END__
forward 5
down 5
forward 8
up 3
down 8
forward 2
