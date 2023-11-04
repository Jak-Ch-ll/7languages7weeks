factorial(1, 1).
factorial(N, X) :- N1 is N - 1, factorial(N1, Y), X is N * Y.

fib(0, 0).
fib(1, 1).
fib(N, X) :- N1 is N - 1, N2 is N - 2, fib(N1, Y), fib(N2, Z), X is Y + Z.
