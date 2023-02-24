fib := method(n,
    previous := 1;
    current := 1;

    while(n > 2,
       temp := current;
       current = current + previous;
       previous = temp;
       n = n - 1;
    )

    return current;
)

n := System args at(1) asNumber

fib(n) print
