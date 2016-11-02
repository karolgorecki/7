# BONUS
=begin

Bonus problem:
If you’re feeling the need for a little more,
write a program that picks a random number.

Let a player guess the number, telling the
player whether the guess is too low or too high.

(Hint: rand(10) will generate a random number from 0 to 9,
and gets will read a string from the keyboard that you can translate to an integer.)

=end

puts "===================================
    G U E S S    G A M E
===================================
"
puts "Guess the number from 1 - 10\n"

# Make some random number
randomNumber = rand(10) + 1
# Set the initial user input to 0
guessedNumber = 0

# Do a while until user guess the number
while guessedNumber != randomNumber
    puts "\nEnter lucky number:"
    # get the number from user and convert it to int
    guessedNumber = gets.to_i

    # check if it's smaller / bigger
    puts '⬆' if guessedNumber < randomNumber
    puts '⬇' if guessedNumber > randomNumber    
end

# User guessed the number!
puts "\n\n👏   C O N G R A T S   👏"
