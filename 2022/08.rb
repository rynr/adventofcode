#!/usr/bin/env ruby

# [[3, 0, 3, 7, 3], [2, 5, 5, 1, 2], [6, 5, 3, 3, 2], [3, 3, 5, 4, 9], [3, 5, 3, 9, 0]]
rows = (ARGV.empty? ? DATA : ARGF).read.split(/\n/).map { |row| row.split(//).map(&:to_i) }
# [[3, 2, 6, 3, 3], [0, 5, 5, 3, 5], [3, 5, 3, 5, 3], [7, 1, 3, 4, 9], [3, 2, 2, 9, 0]]
cols = rows.transpose

found = 0

rows.each_index do |x|
  row = rows[x]
  row.each_index do |y|
    height = rows[x][y]
    if(
        (x == 0 || y == 0 || x == rows.length - 1 || y == row.length - 1) ||
        (rows[x][0, y].max < height) ||
        (cols[y][0, x].max < height) ||
        (rows[x][y + 1, cols.length - y - 1].max < height) ||
        (cols[y][x + 1, cols.length - x - 1].max < height)
    )
      found += 1
    end
  end
end


puts "Solution 1: #{found}"

__END__
30373
25512
65332
33549
35390
