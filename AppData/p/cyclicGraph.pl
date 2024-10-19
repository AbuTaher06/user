edge(a,b).
edge(b,c).
edge(c,d).
edge(d,e).
edge(e,b).
path(A,B):-nextRoute(A,B), write(B).
nextRoute(A,B) :-
    edge(A,X), write(A), write('->'),
    not(member(X,B)),
    (B = X;
    nextRoute(X,B);
    write(X)).
