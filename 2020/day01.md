# Advent of Code 2020

## [Day 1](http://adventofcode.com/2020/day/1)

I initially wanted to use JS, but just loading a file ..  
So, here's my ruby solution.

First I load the data from the input into the array `numbers`. Then I iterate over them twice, while only taking the later part of the array for the second round. Compare, multiply, done.

```ruby
for i in 0..(numbers.length - 1)
  for j in (i..(numbers.length - 1))
    numi = numbers[i]
    numj = numbers[j]
    if(numi+numj == 2020)
      puts "#{numi}, #{numj} -> #{numi*numj}"
    end
  end
end
```

For the second part, I just have to cycle another time and get the result.

I tried to get it done in one row, here's the solution (replacing the 2 with a 3 resolves the second part of this puzzle):

```ruby
puts numbers.combination(2).filter { |a| a.sum == 2020 }.map { |a| a.inject(:*) }
```

- - -
[1](day01.md)
