searchterm = ARGV[0]
filename = ARGV[1]

file = File.open(filename, 'r')

file.each_line.with_index(1) do |line, i|
  if line.match(searchterm)
    puts "Line #{i}: #{line}"
  end
end
