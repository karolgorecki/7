// Enhance the XML program to add spaces to show the indentation structure.

//Enhance the XML program to handle attributes:
// if the first argument is a map (use the curly brackets syntax),
// add attributes to the XML program.
// For example: book({"author": "Tate"}...) would print <book author="Tate">:


OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
    r := Map clone
    call message arguments foreach(i,v,
        r doMessage(v)
    )
    return r
)

Map atPutNumber := method(k,v,
    key := k asMutable removePrefix("\"") removeSuffix("\"")
    val := v
    self atPut(key, val)
)

Builder := Object clone

Builder spaces := 0

Builder forward := method(
    space := ("  " repeated(self spaces))
    writeln(space .. "<" .. (
        msg := call message name
        firstMessage := call message arguments first
        if (firstMessage != nil,
            attrs := doMessage(firstMessage)
            if(attrs isKindOf(Map),
                attrs foreach(k,v,
                    msg = msg .. " " .. k .. "=\"" .. v .. "\""
                )
            )
        )
        msg
    ) ..">")
    self spaces = spaces + 1
    call message arguments foreach(arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(space .. "  " .. content)))
    self spaces = spaces - 1
    writeln(space .. "</", call message name, ">")

)

doFile("./x.io")
