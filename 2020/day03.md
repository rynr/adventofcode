# Advent of Code 2020

## [Day 3](http://adventofcode.com/2020/day/3)

The logic is not complicated today. I need to read the puzzle input, and then walk through the different rows. For the second part, you even need to allow going every second row.

I loaded the input info `field`, into a two-dimensional array, transforming `#` to `true` and ` ` to `false`:

```ruby
field = File.read(ARGV[0]).split("\n").map { |row| row.split(//).map { |spot| spot == '#' }}
```

I extracted the `rows` and `columns` from the input:

```ruby
rows = field.length
columns = field.map { |row| row.length }.max
```

Now i added the variables `step_x` and `step_y`, retrieve the location in the `field` using modulo for the x-axis.

```ruby
(1..(@rows/@step_y)).filter { |step| @field[step * @step_y % @rows][step * @step_x % @columns] }.count
```

The sum is now 

- - -
[1](day01.md), [2](day02.md), 3
