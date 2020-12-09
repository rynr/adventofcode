# Advent of Code 2020

## [Day 8](http://adventofcode.com/2020/day/8)

Finally, I need to build an interpreter. Luckily, I did this some years ago
already in one of the puzzles, so here's what I do. I create a `Handheld` class
that takes the program as initial parameter and can step through. It keeps the
relevant state, and does any step with the method `step`. I can check, if the
new position is already visited.

```ruby
class Handheld

  def initialize(program)
    @program = program
    @accumulator = 0
    @visited = []
    @pos = 0
  end

  def acc(num)
    @accumulator += num
    @pos += 1
  end

  def jmp(num)
    @pos += num
  end

  def nop(num)
    @pos += 1
  end

  def step
    @visited.push @pos
    self.send(*@program[@pos])
  end

  def accumulator
    @accumulator
  end

  def second_visit?
    @visited.include? @pos
  end

  def final_position?
    @pos == @program.length
  end

end
```

For the first part, we need to step through until:

```ruby
until handheld.second_visit?
  handheld.step
end
```

For the second part, the program needs to be patched, and run until either a
second visit happens or the final position is reached. This needs to be done
for all possible patched versions.

```ruby
until handheld.second_visit? || handheld.final_position?
  handheld.step
end
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md), 8, [9](day09.md)
