fib := method(n
    if(n < 3,
        return 1
    )

    return fib_1(n - 1) + fib_1(n - 2)
)

n := System args at(1) asNumber

fib(n) print
