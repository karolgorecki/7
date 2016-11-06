// 5.
// Write a prototype for a two-dimensional list.
// The dim(x, y) method should allocate a list of y lists that are x elements long.
// set(x, y, value) should set a value, and get(x, y) should return that value.

// 6. LATER:
// Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y)
// on the original list.

// 7. Write the matrix to a file, and read a matrix from a file.


Td := List clone
Td show := method(
    out := "___ MATRIX ___ \n"
    self foreach(i,v,
        out = out .. (v join("\t")) .. "\n"
    )
)
Td dim := method(x,y,
    // If user makes: Td dim(x,y) we must clone it to avoid overriding
    if (self proto type == "List", return Td clone dim(x,y))
    self setSize(x)
    temp := List clone
    temp setSize(y)

    self foreach(i,v, self atPut(i, (temp clone)))
)
Td set := method(x,y,v,
    self at(x) atPut(y,v)
    self
)
Td get := method(x,y,
    self at(x) at(y)
)

wot := Td dim(2,2)
wot set(0,0,"A") set(0,1, "B") set(1,1, "D") set(1,0, "C")

wat := Td dim(1,2)

"GET THE 0x0" println
wat set(0,0, "LOL") get(0,0) println
"" println

wot show println
wat show println
