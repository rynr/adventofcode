# Advent of Code 2020

## [Day 6](http://adventofcode.com/2020/day/6)

Those puzzles are just ideal for the ruby language.

After loading the input completely into a variable (`input`), it's just
splitting, combining and counting.

**Part 1**

```ruby
#     +------------------------------------------------------------------------------ Split each group
#     |             +---------------------------------------------------------------- Each group
#     |             |           +---------------------------------------------------- Remove line breaks
#     |             |           |            +--------------------------------------- Split each answer
#     |             |           |            |         +----------------------------- Remove duplicates
#     |             |           |            |         |    +------------------------ Count answers
#     |             |           |            |         |    |       +---------------- Get sum
input.split("\n\n").map { |e| e.tr("\n", '').split(//).uniq.count }.sum
```

**Part 2**

```ruby
#     +------------------------------------------------------------------------------------------------ Split groups
#     |             +---------------------------------------------------------------------------------- Remove linebreak from last group
#     |             |            +--------------------------------------------------------------------- For each group
#     |             |            |           +--------------------------------------------------------- Split each answer
#     |             |            |           |                       +--------------------------------- Split each cwpositive answer
#     |             |            |           |                       |           +--------------------- Only get the ones available for all
#     |             |            |           |                       |           |          +---------- Count them
#     |             |            |           |                       |           |          |       +-- Get sum
input.split("\n\n").map(&:chomp).map { |e| e.split("\n").map { |s| s.split(//) }.inject(:&).count }.sum
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), 6, [7](day07.md), [8](day08.md)
