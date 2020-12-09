# Advent of Code 2020

## [Day 7](http://adventofcode.com/2020/day/7)

Yes, it starts that we need to do a bit more.  
Preparation is all, we first need to read all the data so that we can easily
handle the data.

For the first part, I need to know, into which bags any other bag will fit into.
So I create a Hash (other languages call it a Map or Object) with the key of the
inner bag associated with a list of all possible outer bag.

For the second part, I need to know the other direction including the numbers.
So I use a Hash with the outer bag and put another Hash inside with the inner
bag as key and the numbers as value.

```ruby
    @data_a = {}
    @data_b = {}
    input.split("\n").each do |l|
      outer = l[/^(.*?) bags/,1]
      @data_b[outer] ||= {}
      l[/contain (.*)/,1].split(/,/).map do |s|
        next if s.match(/no other bags/)
        count, inner = s.match(/ *(\d+) (.*?) bags?/i).captures
        @data_a[inner] ||= []
        @data_a[inner].push outer
        @data_b[outer][inner] = count.to_i
      end
    end
  end
```

## Part 1

So, I need a list of all bags inside, and add the same for the inner bags as
well. I recursively include the same call. I'm pretty lazy here, and just put
arrays into arrays into arrays and flatten at the end. I even accept `nil`
values and just remove them at he end with `compact`.

```ruby
  def outer_bags_for(bag)
    @data_a[bag] && @data_a[bag].map do |outer|
        outer.nil? ? [] : [outer, outer_bags_for(outer)]
    end.flatten.uniq.compact || []
  end
```

## Part 2

This is mainly the same, I get the number and increase it with recursive calls.

```ruby
  def inner_bags_for(bag)
    @data_b[bag].keys.inject(0) { |count, inner| count + @data_b[bag][inner] + @data_b[bag][inner] * inner_bags_for(inner) }
  end
```

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md), 7, [8](day08.md), [9](day09.md)
