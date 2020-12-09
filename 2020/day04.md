# Advent of Code 2020

## [Day 4](http://adventofcode.com/2020/day/4)

It's reading and then filtering today, so let's first read the file, split the different passports and extract the properties:

```ruby
passports = File.read(ARGV[0]).split("\n\n").map { |passport| passport.split(/[\n\s]/).to_h { |prop| prop.split(/:/) } }
```

For the first part, it's just checking that all required properties are available. I created a list of required properties, and compared them, then it's just counting:

```ruby
REQUIRED = %w(byr iyr eyr hgt hcl ecl pid) # cid is ignored
passports.filter { |passport| (REQUIRED - passport.keys).empty? }.count
```

The second part was a bit more annoying, and I missed to match the whole string, which took me a while to figure out.

```ruby
passports.filter do |passport|
  passport['byr'] &&                       /^(19[23456789][0-9]|200[012])$/.match(passport['byr']) &&
  passport['iyr'] &&                                    /^(201[0-9]|2020)$/.match(passport['iyr']) &&
  passport['eyr'] &&                                    /^(202[0-9]|2030)$/.match(passport['eyr']) &&
  passport['hgt'] && /^(1[5678][0-9]cm|19[0123]cm|59in|6[0-9]in|7[0-6]in)$/.match(passport['hgt']) &&
  passport['hcl'] &&                                       /^#[0-9a-f]{6}$/.match(passport['hcl']) &&
  passport['ecl'] &&                      /^(amb|blu|brn|gry|grn|hzl|oth)$/.match(passport['ecl']) &&
  passport['pid'] &&                                           /^[0-9]{9}$/.match(passport['pid'])
end.count
```

The different regex can probably be made better, but it worked for me.

- - -
[1](day01.md), [2](day02.md), [3](day03.md), 4, [5](day05.md), [6](day06.md), [7](day07.md), [8](day08.md), [9](day09.md)
