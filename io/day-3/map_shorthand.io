OperatorTable addAssignOperator(":", "atPutShorthand")

curlyBrackets := method(
    map := Map clone
    call message arguments foreach(arg,
        map doMessage(arg)
    )
    map
)

Map atPutShorthand := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)



Map new := method(
    arg := call message arguments first
    if(arg type != "Sequence", arg = arg asString)
    doString(arg)
)

map := Map new({"foo":"bar"})

