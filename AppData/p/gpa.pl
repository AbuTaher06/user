grade(english, 3).
grade(math, 3).
grade(history, 2).

gpa() :-
    findall(Grade, grade(_, Grade), Grades),
    sum_list(Grades, TotalGrade),
    length(Grades, NumberOfCourses),
    GPA is TotalGrade / NumberOfCourses,
    format("GPA is: ~2f~n", [GPA]).
