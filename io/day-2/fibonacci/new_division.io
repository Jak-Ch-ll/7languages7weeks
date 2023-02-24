// load into REPL with `doFile("new_division.io")`

Number div := Number getSlot("/")

Number / = method(n,
    if(n == 0, return 0)

    self div(n)
)

