#!/usr/bin/env ruby

# [["$", "cd", "/"], ["$", "ls"], ["dir", "a"], ["14848514", "b.txt"], …]
input = (ARGV.empty? ? DATA : ARGF).read.split(/\n/).map { |l| l.split(/ /) }

# {["/", "b.txt"]=>"14848514", ["/", "c.dat"]=>"8504156", …}
tree = input.inject([[], {}]) do |tree, line|
  case line[0]
  when '$'
    case line[1]
    when 'cd'
      case line[2]
      when '..'
        tree[0].pop
      else
        tree[0].push line[2]
      end
    end
  when 'dir'
  when /\d/
    tree[1][tree[0] + [line[1]]] = line[0]
  end
  tree
end[1]

# {"/"=>48381165, ""=>96762330, "//a"=>94853, "//a/e"=>584, "//d"=>24933642}
dirSizes = tree.inject({}) do |s, e|
  traverse = e[0]
  while(!traverse.empty?)
    traverse.pop
    path = traverse.join('/')
    s[path] ||= 0
    s[path] += e[1].to_i
  end
  e[0].pop
  s[e[0].join('/')] ||= 0
  s[e[0].join('/')] += e[1].to_i
  s
end

# 8381165
requiredFree = 30000000-(70000000-dirSizes['/'])

puts "Solution 1: #{dirSizes.values.filter {|s| s <= 100000 }.sum}"
puts "Solution 2: #{dirSizes.values.filter {|s| s >= requiredFree}.sort.first}"

__END__
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
