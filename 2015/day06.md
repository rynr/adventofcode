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
end

field = Field.new
File.open('input.txt').read.split("\n").each do |row|
  method, x1, y1, x2, y2 = /(.*)\s(\d+),(\d+).*(\d+),(\d+)/.match(row).captures
  field.switch(x1.to_i, y1.to_i, x2.to_i, y2.to_i, method.gsub(/\s/, '_').to_sym)
end
puts field.lights_on
````

