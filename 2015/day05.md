I decided to do ruby again.

I have two solutions.

````ruby
vovels = 'aeiou'.split('').freeze
forbidden = ['ab', 'cd', 'pq', 'xy'].freeze
File.open('input.txt').read.split("\n").select { |word|
  prev = nil
  v = 0
  t = false
  f = true
  word.split('').each do |char|
    v += 1      if(vovels.include?(char))
    t = true    if(char == prev)
    f = false   if(forbidden.include?([prev, char].join('')))

    prev = char
  end
  v >= 3 && t & f
}.length
````

Here's the other solution:

````ruby
File.open('input.txt').read.split("\n").select { |word|
  ![ /([a-z])\1/, /[aeiou].*[aeiou].*[aeiou]/, /^((?!ab).)*$/, /^((?!cd).)*$/, /^((?!pq).)*$/, /^((?!xy).)*$/ ].map { |r| r.match(word) ? true : false }.include?(false)
}.length
````

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md)
