// 1.
// Evaluate 1 + 1 and then 1 + "one".
// Is Io strongly typed or weakly typed?
// Support your answer with code.

1 + 1 // 2 -> Number

1 + "one" // throws error
// Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
// A: which means that it's strongly typed


// 2.
// Is 0 true or false?
// What about the empty string?
// Is nil true or false? Support your answer with code.

0 == true // false
"" == true // false
nil == true // false

// but when using `if` to check we get different results
if(0, "TRUE", "FALSE") // true
if("", "TRUE", "FALSE") // true
if(nil, "TRUE", "FALSE") // false


// 3.
// How can you tell what slots a prototype supports?
Object slotNames
Car := Object clone
Car slotNames
Car proto // hmm? 

// 4.
// What is the difference between = (equals),
// := (colon equals), and ::= (colon colon equals)?
// When would you use each one?
/*
    ::= Creates slot, creates setter, assigns value
    := Creates slot, assigns value
    = Assigns value to slot if it exists, otherwise raises exception
*/