eightqueens(Queens):-
    Queens = [1/_,2/1,3/_,4/_,5/_,6/_,7/_,8/_],
    safe(Queens),
    true.


safe([]).
safe([X/Y | Rest]):-
    safe(Rest),
    %% member(X, [1,2,3,4,5,6,7,8]),
    member(Y, [1,2,3,4,5,6,7,8]),
    nocheck(Rest, X/Y),
    true.


/*nocheck(+Queens, +Queen)*/
nocheck([],_).
nocheck([X1/Y1|Rest], X/Y):-
    X=\=X1,
    Y=\=Y1,
    abs(Y1-Y) =\= abs(X1-X),
    nocheck(Rest, X/Y),
    true. 