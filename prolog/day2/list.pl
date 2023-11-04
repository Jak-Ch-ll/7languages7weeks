reverse([], []).
reverse([X], [X]).
reverse([Head | Tail], Result) :- reverse(Tail, TailResult), append(TailResult, [Head], Result).

smallest([X], X).
smallest([Head | Tail], X) :- smallest(Tail, Y), min(Head, Y, X).

min(X, Y, Z) :- X < Y -> Z is X; Z is Y.

bubble_up([], []).
bubble_up([X], [X]).
bubble_up([A, B | Tail], Result) :-
    A < B ->
        mysort([B | Tail], SubResult),
        append([A], SubResult, Result);
        mysort([A | Tail], SubResult),
        append([B], SubResult, Result).

my_sort(List, Result) :-
    bubble_up(List, NewList),
    append(SubList, [_], NewList),
    my_sort(SubList, Result).
