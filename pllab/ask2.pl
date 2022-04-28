solve(SetOfMoves):-
    length(Moves, N), 
    %% N < 8,  
    initial(D), 
    setof(Moves, solve(D, Moves), SetOfMoves),
    true.


/*solve(+Config, -Moves)*/
/*Τα Input τα συμβολίζουμε με + και τα Outputs με - */
solve(Config, []):- final(Config).
solve(Config, [Move|Moves]):-
    move(Config, Move, NewConfig),
    safe(NewConfig),
    solve(NewConfig, Moves),
    true.

safe(config(Man, Wolf, Goat, Gabbage)):-
    together_or_seperated(Man, Wolf, Goat),
    together_or_seperated(Man, Goat, Gabbage),
    true.

together_or_seperated(Coast, Coast, Coast).
together_or_seperated(_, Coast1, Coast2):- opposite(Coast1, Coast2).


/*config(Man, Wolf, Goat, Gabbage)*/


initial(config(w,w,w,w)).
final(config(e,e,e,e)).

/*move(Conf, Move, Conf2)*/
move(config(Coast, Coast,G,C), wolf, config(OppositeCoast, OppositeCoast,G,C)):-
    opposite(Coast,OppositeCoast),
    true.
move(config(Coast, W, Coast,C), goat, config(OppositeCoast, W, OppositeCoast, C)):-
    opposite(Coast,OppositeCoast),
    true.
move(config(Coast, W, G, Coast), cabbage, config(OppositeCoast, W, G, OppositeCoast)):-
    opposite(Coast,OppositeCoast),
    true.
move(config(Coast, W, G, C), nothing, config(OppositeCoast, W, G, C)):-
    opposite(Coast,OppositeCoast),
    true.


opposite(w,e).
opposite(e,w).