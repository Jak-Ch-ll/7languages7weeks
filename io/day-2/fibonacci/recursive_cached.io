dict := Map clone

fib := method(n,
    if(n < 3,
        return 1
    )

    lookup := dict at(n asString)

    if(lookup, return lookup)

    result := fib(n - 1) + fib(n - 2)

    dict atPut(n asString, result)

    return result
)

n := System args at(1) asNumber

fib(n) print
