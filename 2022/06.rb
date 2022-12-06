#!/usr/bin/env ruby

# Preparation takes a bit more effort this time.
input = (ARGV.empty? ? DATA : ARGF).read

def start_of_packet_marker(code, code_length)
  code.rindex(code.split(//)
                  .each_cons(code_length)
                  .find { |packet| packet.uniq.length == code_length }.join
  ) + code_length
end

puts "Solution 1: #{start_of_packet_marker(input, 4)}"
puts "Solution 2: #{start_of_packet_marker(input, 14)}"

__END__
nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg
