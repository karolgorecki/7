# DAY-2 ruby
someArray = (0..15).to_a

# Print the contents of an array of sixteen numbers,
# four numbers at a time, using just each.
# Now, do the same with each_slice in Enumerable.
c = 1
someArray.each do |item|
    print "#{item}"
    puts if c != 1 && c % 4 == 0
    c = c + 1
end

puts

someArray.each_slice 4 do |a,b,c,d|
    print(a,b,c,d, "\n")
end

puts

someArray.each_slice(4) do |i4|
    puts i4.join
end

puts

(1..16).each do |i|
    print i
    puts if i % 4 == 0
end