# 1. Print the string “Hello, world.”
puts 'Hello, world.'

# 2. For the string “Hello, Ruby,” find the index of the word “Ruby.”
puts 'Hello, Ruby'.index 'Ruby'

# 3. Print your name ten times.
# using times
# 10.times{ |i| puts "Karolek #{i}" }
10.times do
    puts 'Karol 1'
end

# using for in
for i in 0..9 do
    puts 'Karol 2'
end

# using each
# (1..10).each{ puts 'Karol 4'}
(1..10).each do
    puts 'Karol 3'
end

# 4. Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
(1..10).each do |idx|
    puts "This is sentence number #{idx}"
end

# 5. Run a Ruby program from a file.
# ruby someRubyFile.rb
