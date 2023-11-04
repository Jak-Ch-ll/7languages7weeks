sudoku(Puzzle, Solution) :-
    Solution = Puzzle,
    Puzzle = [S11, S12, S13, S14,
              S21, S22, S23, S24,
              S31, S32, S33, S34,
              S41, S42, S43, S44],
    find_min(Puzzle, 1),
    find_max(Puzzle, 4),

    Row1 = [S11, S12, S13, S14],
    Row2 = [S21, S22, S23, S24],
    Row3 = [S31, S32, S33, S34],
    Row4 = [S41, S42, S43, S44],
    Col1 = [S11, S21, S31, S41],
    Col2 = [S12, S22, S32, S42],
    Col3 = [S13, S23, S33, S43],
    Col4 = [S14, S24, S34, S44],
    Square1 = [S11, S12, S21, S22],
    Square2 = [S13, S14, S23, S24],
    Square3 = [S31, S32, S41, S42],
    Square4 = [S33, S34, S43, S44],

    valid(Row1),
    valid(Row2),
    valid(Row3),
    valid(Row4),
    valid(Col1),
    valid(Col2),
    valid(Col3),
    valid(Col4),
    valid(Square1),
    valid(Square2),
    valid(Square3),
    valid(Square4).

valid([]).
valid([Head|Tail]) :-
    fd_all_different(Head),
    valid(Tail).

find_min([X], X).
find_min([Head | Tail], X) :- find_min(Tail, Y), min(Head, Y, X).

find_max([X], X).
find_max([Head | Tail], X) :- find_max(Tail, Y), max(Head, Y, X).

min(X, Y, Z) :- X < Y -> Z is X; Z is Y.
max(X, Y, Z) :- X < Y -> Z is Y; Z is X.
