doFile("map_shorthand.io")

Builder := Object clone do(
    indentLvl := 0
    indentString := "    "

    indent := method(indentLvl repeat(write(indentString)))

    openTag := method(tag, attributes,
        indent()
        if(attributes isNil) then(
            writeln("<", tag, ">")
        ) else(
            writeln("<", tag)
            attributes foreach(key, value,
                indent()
                writeln(indentString, "#{key}=\"#{value}\"" interpolate)
            )
            indent()
            writeln(">")
        )
    )

    closeTag := method(tag,
        indent()
        writeln("</", tag, ">")
    )

    writeText := method(text,
        indent()
        writeln(text)
    )

    forward := method(
        args := call message arguments
        tag := call message name
        attributes := nil

        if(args first asString beginsWithSeq("curlyBrackets"),
            attributes = doString(args first asString)
            args = args rest
        )

        openTag(tag, attributes)

        indentLvl = indentLvl + 1
        args foreach(arg,
            content := self doMessage(arg)
            if(content type == "Sequence", writeText(content))
        )
        indentLvl = indentLvl - 1

        closeTag(call message name)
    )
)


Builder div(
    { "action": "Give me a list!" },
    ul(
        {
            "title": "Prototypal programming languages"
            "foo": "bar"     
        },
        li(
            { "active": "true" },
            "Io"
        ),
        li("Lua"),
        li("JavaScript")
    )
)

