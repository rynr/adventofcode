# Advent of code 2016

## [Day 5](http://adventofcode.com/2016/day/5)

This day it's just pure brute force calculation of MD5-hashes:

``` ruby
while(true) do
  hash = Digest::MD5.hexdigest("#{token}#{count}")
  while(hash[0,5] != '00000')
    count += 1
    hash = Digest::MD5.hexdigest("#{token}#{count}")
  end

  puts password[5]
  count += 1
end
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), [7](day07.md), [8](day08.md), [9](day09.md)
