// Write a program that gives you ten tries to guess a random number from 1–100.
// If you would like, give a hint of “hotter” or “colder” after the first guess.

"----------------------\nGUESS GAME\n----------------------\n" println

givenNumber := 0
getNumber := method(File standardInput readLine asNumber)
tries := 10
randomNumber := (Random value(100) floor) + 1

while(tries > 0 and givenNumber != randomNumber,
    ("Tries left: " .. tries) println
    givenNumber := getNumber
    tries = tries - 1
    if (givenNumber == randomNumber, "YAY!!!!!!" println)
    if (givenNumber < randomNumber, "⬆" println)
    if (givenNumber > randomNumber, "⬇" println)
    // ("R number is: " .. randomNumber) println // FOR DEBUG
)

if (givenNumber != randomNumber,
    ("NOT THIS TIME... The random number was: " .. randomNumber) println
) 
