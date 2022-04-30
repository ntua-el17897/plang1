fact(0,1):-true.

/*First test. Είναι λάθος*/
/*Λείπει το statement για αρνητικά Ν*/
fact(N,F):-
    N1 is N - 1,
    fact(N1,F1),
    F is F1 * N,
    !.


/*zebra Problem*/
/* house(Nationality, Color, Pet, Smoke, Drink) */
zebra(Houses):-
    
    Houses = [house(norwegian,_,_,_,_), house(_,blue,_,_,_), house(_,_,_,_,milk), H4, H5],
    member(house(englishman, red,_,_,_), Houses),
    member(house(spanlard,_,dog,_,_), Houses), 
    member(house(_,green,_,_,_coffee), Houses),
    member(house(ukranian,_,_,_,tea), Houses),
    rightof(house(_,ivory,_,_,_),house(_,green,_,_,_), Houses),
    member(house(_,_,snails,old_gold,_), Houses),
    member(house(_,yellow,_,kools,_), Houses),
    nextto(house(_,_,_,chesterfields,_), house(_,_,fox,_,_), Houses),
    nextto(house(_,_,_,kools,_), house(_,_,horse,_,_), Houses),
    member(house(_,_,_,lucky_strike, orange_juice), Houses),
    member(house(japanese,_,_,parliaments,_),Houses),
    true.

    
ownerZebra(Owner):-
    zebra(Houses),
    member(house(Owner, _, zebra, _, _), Houses).

rightof(L,R,[L,R,_,_,_]).
rightof(L,R,[_,L,R,_,_]).
rightof(L,R,[_,_,L,R,_]).
rightof(L,R,[_,_,_,L,R]).

nextto(H1, H2, Houses):- rightof(H1, H2, Houses).
nextto(H1, H2, Houses):- rightof(H2, H1, Houses).





tsbs_generate_data --use-case="iot" --seed=123 --scale=4000 \
    --timestamp-start="2016-01-01T00:00:00Z" \
    --timestamp-end="2016-01-02T00:00:00Z" \
    --log-interval="60s" --format="timescaledb" \