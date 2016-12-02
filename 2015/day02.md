Day 2
-----

I have to calculate the dimension of some paper from some 3d-sizes.
I use ruby for the solution:

````ruby
File.open("input.txt").read.split("\n").map { |row|
  x, y, z = row.split('x').map(&:to_i)
  areas = [ x*y, x*z, y*z ]
  areas.min + areas.inject(0) {|s,e| s+e*2}
}.inject(0, :+)
````

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md)
