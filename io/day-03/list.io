// Create a list syntax that uses brackets.
Object squareBrackets := method(//a,b,
    // a print
    // b print
    call message arguments
)

List squareBrackets := method(a,b,
    if (b != nil,
        self atPut(a,b),
        self at(0)
    )
)

lista := [1,2,3,4]

lista println

lista[0] println // 2
lista[0, "Foo"]

lista println
