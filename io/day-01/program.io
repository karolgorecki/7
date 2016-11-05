// Run an Io program from a file.
// io program.io
// Execute the code in a slot given its name.
sayHello := method("Just say Hello!" println)

perform("sayHello")


Foo := Object clone
Foo sayHi := method(name, ("Hi " .. name) println)

// Foo getSlot("sayHi") call
Foo getSlot("sayHi") call("Foo")

// Foo perform("sayHi")
Foo perform("sayHi", "Foo")
