TwoDimList := Object clone do(
    new := method(x, y,
        twoDimList := TwoDimList clone
        twoDimList dim(x, y)
        twoDimList
    )

    dim := method(x, y,
        outer := list
        x repeat(
            inner := list
            y repeat (inner push(nil))
            outer push(inner)
        )
        self list := outer
    )

    set := method(x, y, value,
        self list at(x) atPut(y, value)
    )

    get := method(x, y,
        self list at(x) at(y)
    )

    print := method(
        self list foreach(inner,
            inner join(", ") println
        )
    )

    transpose := method(
        x := self list at(0) size
        y := self list size

        newList := TwoDimList new(x, y)

        self list foreach(i, inner,
            inner foreach(j, value,
                newList set(j, i, value) 
            )
        )

        newList
    )

    toFile := method(path,
        file := File with(path) 
        file remove
        file openForAppending

        self list foreach(inner,
            line := inner join(", ")
            file write(line, "\n")
        )

        file close
    )

    fromFile := method(path,
        twoDimList := TwoDimList clone

        file := File with(path)
        file openForReading

        twoDimList list := file readLines map(
            split(", ") mapInPlace(value,
                if(value == "nil") then(
                    value = nil
                ) elseif(value asNumber) then(
                    value = value asNumber
                )

                value
            )
        )

        twoDimList
    )
)


myList := TwoDimList new(3,4)
myList set(2, 0, "hello world")
myList set(1,1, 3)
transposedList := myList transpose

"---" println
"Original list:" println
myList print

"---" println
"Transposed list:" println
transposedList print

// File stuff
myList toFile("TEST")

"---" println
"List read from file:" println
listFromFile := TwoDimList fromFile("TEST")
listFromFile print

