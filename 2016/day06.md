# Advent of code 2016

## [Day 6](http://adventofcode.com/2016/day/6)

This time it's a simple count of characters.

``` ruby
puts ARGF.map do |line|
  counts = line.split("").inject(Hash.new(0)) { |h,r| h[r] += 1; h }
  res.max_by { |r| counts[r] }
end
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md), [8](day08.md), [9](day09.md)

