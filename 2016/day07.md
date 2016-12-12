# Advent of code 2016

## [Day 7](http://adventofcode.com/2016/day/7)

To test if a `abba`-element is present in the strings, I created a method.
First i split the text into parts of the length 4, then I test that there is not only one character. Then it's a comparison with the reverse to check if `abba` applies.

``` ruby
def abba(string)
  (0..(string.length-4)).map { |i| string[i,4] }.select { |s|
    s.split("").uniq.size > 1 && s == s.reverse
  }
end
```

Now I only need to run through the different parts and check if there is or is not an `abba`-part:

``` ruby
puts "abba: " + (ARGF.map { |line|
  (!line.scan(/\[(.*?)\]/).map { |a| a.map { |b| abba(b).any? }.any?}.any?) && abba(line.gsub(/\[(.*?)\]/, "_")).any?
}.count(true).to_s)
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md), [8](day08.md), [9](day09.md)
