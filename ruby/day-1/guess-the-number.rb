first = 1
last = 10
target = rand(first..last)

puts "Guess a number between #{first} and #{last}"

loop do
  n = gets.to_i

  if n < first or n > last
    puts "Number must be between #{first} and #{last}. Guess again!"
    next
  elsif n < target
    puts 'Guess higher!'
  elsif n > target
    puts 'Guess lower!'
  else
    puts "You've got it. #{target} was the correct answer!"
    break
  end
end
