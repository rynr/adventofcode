# Advent of Code 2020

## [Day 2](http://adventofcode.com/2020/day/2)

It's mainly reading the file, extracting the different parts and compare them.

```ruby
puts File.read(ARGV[0]).split("\n").filter { |line|
  s = StringScanner.new(line)

  # indexes: 1      2       3       4
  #          +------------------------------------ Number of minimum occurences (scanned as string)
  #          |      +----------------------------- Number of maximum occurences (scanned as string)
  #          |      |       +--------------------- The character to be checked
  #          |      |       |       +------------- The password to check
  s.scan(/^(\d+)\-(\d+)\s+(\w):\s+(\w+)/)

  # +--------------------------------------------- Password
  # |  +------------------------------------------ number of the characters in password
  # |  |           +------------------------------ Is the number between …
  # |  |           |          +------------------- minimum occurences (as integer)
  # |  |           |          |          +-------- maximum occurences (as integer)
  s[4].count(s[3]).between?(s[1].to_i, s[2].to_i)
}.count
```

The second part is easier, the main trick is the `^` (`XOR`).  
You also need to take into account that the index of an array starts with `0`, while the index given starts with `1`.

```ruby
puts File.read(ARGV[0]).split("\n").filter { |line|
  s = StringScanner.new(line)
  s.scan(/^(\d+)\-(\d+)\s+(\w):\s+(\w+)/)
  (s[4][s[1].to_i-1] == s[3]) ^ (s[4][s[2].to_i-1] == s[3])
}.count

```

- - -
[1](day01.md), 2, [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md)
