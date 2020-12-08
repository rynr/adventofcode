# Advent of Code 2020

## [Day 5](http://adventofcode.com/2020/day/5)

This day, I did not need to do any programming.  
If you understand what the seating numbers mean, it's simple binary.
You just need to convert all `R` and `B` to `1`, and `L`and `F` to `0`.
I opened the puzzleinput with my favorite editor
([`vi`](https://vim.org)), replaced the different values, then I just
sorted all lines.

```
:%s/[BR]/1/g
:%s/[LF]/0/g
:%sort!
```

Now, the last row was the result in binary.

The second part was a little more tricky. I needed to find a gab
between the numbers. The gab is, where in two consecutive rows have
the same last `1` or `0`. So I set vi to highlight all search results
(`:set hlsearch`), scrolled through the list, and could easily spot the
location.

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), 5, [6](day06.md), [7](day07.md), [8](day08.md)
