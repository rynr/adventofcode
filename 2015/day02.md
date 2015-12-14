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
