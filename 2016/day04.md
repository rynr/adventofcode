# Advent of code 2016

## [Day 4](http://adventofcode.com/2016/day/4)

This time it's a bit longer. I first need to create a method that converts me
a map without loosing any value.

``` ruby
class Hash
  # like invert but not lossy
  # {"one"=>1,"two"=>2, "1"=>1, "2"=>2}.inverse => {1=>["one", "1"], 2=>["two", "2"]}
  def safe_invert
    each_with_object({}) do |(key,value),out|
      out[value] ||= []
      out[value] << key
    end
  end
end

result = ARGF.inject(0) do |sum, line|
  name, number, check = line.match(/([a-z\-]+)-(\d+)\[([a-z]+)\]/i).captures

  counts = (name.split("") - ['-']).inject(Hash.new(0)) { |total, e| total[e] += 1; total}.safe_invert
  full = counts.keys.sort.reverse.inject('') { |result, key| result + counts[key].sort.join('') }

  if full.start_with?(check)
    sum + number.to_i
  else
    sum
  end
end

puts result
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md), [8](day08.md), [9](day09.md)
