# Advent of code 2016

## [Day 9](http://adventofcode.com/2016/day/9)

`strscan` is your friend here. Luckyly I was pointed out to this class, and it
really makes this job pretty easy:

``` ruby
require 'strscan'

def parse(line)
  line = StringScanner.new(line.gsub(/\n/, ""))
  result = 0
  while !line.eos? && line.scan(/(\w*)\((\d+)x(\d+)\)/)
    times = (line[3] || 1).to_i
    result += line[1].length

    result += line.scan(Regexp.compile(".{#{line[2] || 0}}")) * times
  end
  result += line.rest.length
  return result
end

ARGF.each do |line|
  puts parse(line)
end
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md), [8](day08.md), [9](day09.md)
