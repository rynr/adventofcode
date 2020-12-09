# Advent of Code 2020

## [Day 9](http://adventofcode.com/2020/day/9)

The preamble needs to set up and cleared once enough values are in there.

```ruby
preamble = []
# Cycle through all indexes
input.each_index do |index|
  # If the preamble is filled
  if index >= 25
    #            +----------------------------------------------- Get all combinations
    #            |                              +---------------- Get sum of the combination
    #            |                              |            +--- Check if the sum matches the next entry
    if !preamble.combination(2).map { |arr| arr.inject(:+) }.include? input[index]
      # Report the result
      puts input[index]
    end
    # Remove oldest entry from preamble
    preamble.shift
  end
  # Add new entry to the preamble
  preamble.push input[index]
end
```

For the second part:

```ruby
# Cycle through all indexes
@input.each_index do |index|
  nums = []
  sum = 0;
  add = 0;
  # Check if the sum is greater than the searched value
  while(sum < goal)
    # Increase the sum of the value of current index
    sum += @input[index + add]
    # Cate list of all entries for the current sum
    nums.push(@input[index + add])
    # If the sum is the goal
    if(sum == goal)
      # report the sum of the highest and lowest entry
      puts nums.min + nums.max
    end
    add += 1
  end
end
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md), [8](day08.md), 9
