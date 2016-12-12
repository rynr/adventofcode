# Advent of code 2016

## [Day 2](http://adventofcode.com/2016/day/2)

This time, I store the values of the pad in a array of arrays.

``` ruby
PAD = [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ],
]
```

Now I pass the location as parsing the instructions:

``` ruby
pads = %w[ULL RRDDD LURDL UUUUD].map do |row|
  position = row.split('').inject([1,1]) do |pos, step|
    case step
    when 'R'
      pos[1] += 1 if pos[1] < 2
    when 'L'
      pos[1] -= 1 if pos[1] > 0
    when 'U'
      pos[0] -= 1 if pos[0] > 0
    when 'D'
      pos[0] += 1 if pos[0] < 2
    end

    pos
  end

  PAD[position[0]][position[1]]
end

puts pads.inspect
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md), [8](day08.md), [9](day09.md)

