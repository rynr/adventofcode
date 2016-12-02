Advent of code 2016
===================

Day 1
-----

To go along the path I created some data to find the correct directions and
calculate the correct location.  
For example, when facing *N*orth, I add `0` values per step to the `x`-axis and
`1` value to the `y`-axis. If I turn to `L`, I will face to `W`:

``` ruby
META = {
  'N' => [ 0,  1, {'L' => 'W', 'R' => 'E'}],
  'E' => [ 1,  0, {'L' => 'N', 'R' => 'S'}],
  'S' => [ 0, -1, {'L' => 'E', 'R' => 'W'}],
  'W' => [-1,  0, {'L' => 'S', 'R' => 'N'}],
}
```

To go through the instructions I now run through them and calculate the next
place.

``` ruby
goal = %w[R5, L5, R5, R3, ...].inject([0, 0, 'N']) { |place, path|
  puts place.inspect
  place[2] = META[place[2]][2][path[0,1]]
  place[0] = place[0] + META[place[2]][0] * path[1..-1].to_i
  place[1] = place[1] + META[place[2]][1] * path[1..-1].to_i

  place
}
```
