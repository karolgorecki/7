#!/usr/bin/env ruby
# Write a simple grep that will print the lines
# of a file having any occurrences of a phrase anywhere in that line.
# You will need to do a simple regular expression match
# and read lines from a file. (This is surprisingly simple in Ruby.)
# If you want, include line numbers.


# can be run as: 
#   $ ./task3.rb foo mock.txt
#   $ ruby task3.rb boo mock.txt
searched = ARGV[0]
regexForSearch = /#{searched}/i
ln = 1
file = ARGV[1] || ''

if File.file?(file)
    puts "\n🔍  for '#{searched}' in 📁  #{file} \n\n"

    File.readlines(file).each do |line|
        puts "[#{ln}]: #{line}" if line =~ regexForSearch

        ln += 1
    end
else 
    puts "Given file doesn't exists!"
end

puts