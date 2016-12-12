# Advent of code 2016

## [Day 3](http://adventofcode.com/2016/day/3)

My logic takes in count that each product of two lengths twice 2 need to be
greater than the sum of all lengths.

``` ruby
puts (ARGF.map do |line|
  elements = line.split(/\s+/).drop(1).map(&:to_i)
  sum = elements.inject(0, :+)
  elements.combination(2).map { |combination| combination.inject(0, :+) }.min * 2 > sum
end.count(true))
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md), [8](day08.md), [9](day09.md)

