palindrome([]).
palindrome([_]).
palindrome([X|Xs]) :-
append(Xs1,[X],Xs), palindrome(Xs1).
append([],Ys,Ys).
append([X|Xs],Ys,[X|Zs]) :- append(Xs,Ys,Zs).