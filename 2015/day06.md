Back to ruby.

And hey, a task where I can use some objects.

````ruby
class Light
  attr_reader :on
  def initialize; @on = false;  end
  def turn_on;    @on = true;   end
  def turn_off;   @on = false;  end
  def toggle;     @on = !on;    end
end

class Field
  def initialize(x = 1000, y = 1000)
    @map = x.times.map { y.times.map { Light.new } }
  end
  def switch(x1, y1, x2, y2, action)
    (x1..x2).each do |x|
      (y1..y2).each do |y|
        @map[x][y].send(action)
      end
    end
  end
  def lights_on
    @map.inject(0) { |res, row| row.inject(res) { |r, l| r += l.on ? 1 : 0 } }
  end
  def to_s
    @map.map { |row| row.map { |l| l.on ? "\u25A0" : "\u25A1" }.join('') }.join("\n")
  end
end

field = Field.new
File.open('input.txt').read.split("\n").each do |row|
  method, x1, y1, x2, y2 = /(.*)\s(\d+),(\d+)[^\d]+(\d+),(\d+)/.match(row).captures
  field.switch(x1.to_i, y1.to_i, x2.to_i, y2.to_i, method.gsub(/\s/, '_').to_sym)
end
puts field.lights_on
````

I added a `to_s`-method to the `Field`-class, so you can get this:
````irb
irb(main):027:0> field = Field.new(10,10)
=> □□□□□□□□□□
□□□□□□□□□□
□□□□□□□□□□
□□□□□□□□□□
□□□□□□□□□□
□□□□□□□□□□
□□□□□□□□□□
□□□□□□□□□□
□□□□□□□□□□
□□□□□□□□□□
irb(main):028:0> field.switch(2,2,4,4,:toggle)
=> 2..4
irb(main):029:0> field.switch(4,4,6,6,:toggle)
=> 4..6
irb(main):030:0> puts field
□□□□□□□□□□
□□□□□□□□□□
□□■■■□□□□□
□□■■■□□□□□
□□■■□■■□□□
□□□□■■■□□□
□□□□■■■□□□
□□□□□□□□□□
□□□□□□□□□□
□□□□□□□□□□
=> nil
irb(main):031:0> 
````

- - -
[1](day01.md), [2](day02.md), [3](day03.md), [4](day04.md), [5](day05.md), [6](day06.md)
