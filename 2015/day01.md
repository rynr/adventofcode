Day 1
-----

We have to count the number of `(` and `)`, so this is my solution:

    cat input.txt | fold -w1 | sort | uniq -c

Now I have the number of `(` and `)`, I just use `bc` to calculate the
difference.
