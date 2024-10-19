fibonacci(1, 0).
fibonacci(2, 1).

fibonacci(N, Result) :-
    N > 2,
    N1 is N-1,
    N2 is N-2,
    fibonacci(N1, Result1),
    fibonacci(N2, Result2),
    Result is Result1 + Result2.
