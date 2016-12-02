Day 1
-----

We have to count the number of `(` and `)`, so this is my solution:

````bash
cat input.txt | fold -w1 | sort | uniq -c
````

Now I have the number of `(` and `)`, I just use `bc` to calculate the
difference.

. . .
[1](2016/day01.md), [2](2016/day02.md), [3](2016/day03.md), [4](2016/day04.md), [5](2016/day05.md), [6](2016/day06.md)
