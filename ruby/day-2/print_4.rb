arr = [
  1, 2, 3, 4,
  5, 6, 7, 8,
  9, 10, 11, 12,
  13, 14, 15, 16
]

def print_with_each(arr)
  counter = 0

  arr.each do |el|
    counter += 1

    print "#{el}, "
    print "\n" if counter % 4 == 0
  end
end

def print_with_each_slice(arr)
  arr.each_slice(4) { |row| puts row.join(', ') }
end

print_with_each_slice arr
