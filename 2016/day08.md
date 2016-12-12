# Advent of code 2016

## [Day 8](http://adventofcode.com/2016/day/8)

I created a real class for today:

``` ruby
class Display
  def initialize(width, height)
    @dots = Array.new(height){Array.new(width)}
  end

  def rect(x, y)
    (0..(y.to_i - 1)).each { |row| (0..(x.to_i - 1)).each { |col| @dots[row][col] = true } } 
  end

  def rotate(dir, x, y)
    self.send dir, x, y
  end

  def column(x, amount)
    buff = (0..(@dots.size-1)).map { |index| @dots[index][x.to_i] }.rotate(-(amount.to_i)).each_with_index { |val,i| @dots[i][x.to_i] = val}
  end

  def row(y, amount)
    @dots[y.to_i] = @dots[y.to_i].rotate(-(amount.to_i))
  end

  def to_s
    @dots.map { |row| row.map { |cell| cell ? '█' : ' ' }.join('') }.join("\n")
  end

  def count_pixels
    @dots.map { |row| row.count(true) }.inject(0, :+)
  end
end
```

So, now I can just have this class take care of everything:
``` ruby
display = Display.new(50, 6)

ARGF.each do |line|
  command = line.gsub(/by|\n|[xy]=/, '').split(/[x ]+/)
  display.send *command
end

puts display.count_pixels
```

So, this is the result for me:
```
███  █  █ ███  █  █  ██  ████  ██  ████  ███ █    
█  █ █  █ █  █ █  █ █  █ █    █  █ █      █  █    
█  █ █  █ █  █ █  █ █    ███  █  █ ███    █  █    
███  █  █ ███  █  █ █    █    █  █ █      █  █    
█ █  █  █ █ █  █  █ █  █ █    █  █ █      █  █    
█  █  ██  █  █  ██   ██  ████  ██  ████  ███ ████ 
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md), [8](day08.md), [9](day09.md)
