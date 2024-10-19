write_to_file :-
    open('tam.txt', write, Stream),    % Open file in write mode
    write(Stream, 'apple(fruit).'), nl(Stream),   % Write the fact
    write(Stream, 'carrot(vegetable).'), nl(Stream), % Write another fact
    write(Stream, 'banana(fruit).'), nl(Stream),  % Write another fact
    close(Stream).    % Close the file

% Predicate to read all facts from a file
read_from_file :-
    open('tam.txt', read, Stream),   % Open file in read mode
    repeat,
    read(Stream, Term),               % Read each term from the file
    ( Term == end_of_file             % Stop if we reach the end of the file
    ->  close(Stream), !              % Close the file and end
    ;   write(Term), nl,              % Write the term to the console
        fail                          % Force backtracking to read the next term
    ).

% Predicate to append facts to a file
append_to_file :-
    open('tam.txt', append, Stream),  % Open file in append mode
    write(Stream, 'grape(fruit).'), nl(Stream),  % Append a fact
    write(Stream, 'potato(vegetable).'), nl(Stream),  % Append another fact
    close(Stream).  % Close the file