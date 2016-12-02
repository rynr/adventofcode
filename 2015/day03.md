Day 3
-----

Ruby is just such a good language to do these kind of things, so I will again
use ruby:

````ruby
x = 0
y = 0
File.open('input.txt').read.split('').inject({'0,0' => 1}) { |r,e|
  case e
    when '<'
      x-=1
    when '>'
      x+=1
    when '^'
      y+=1
    when 'v'
      y-=1
    end
    r["#{x},#{y}"] = 1
    r
}.keys.length
````

Java streams should give some funktionality like this, I should try that in one
of the next tasks.

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md)
