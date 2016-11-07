// Enhance the XML program to add spaces to show the indentation structure.
Builder := Object clone

Builder spaces := 0

Builder forward := method(
    space := ("  " repeated(self spaces))
    writeln(space .. "<", call message name, ">")
    self spaces = spaces + 1
    call message arguments foreach(arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(space .. "  " .. content)))
    self spaces = spaces - 1
    writeln(space .. "</", call message name, ">")

)

Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript"),
    div(
        span("ok1"),
        span("ok2"),
        span("ok3")
    )
)
