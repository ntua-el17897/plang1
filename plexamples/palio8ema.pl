maximize2(Tree, MaxTree) :-
	find_max(Tree, 0, Max),
	subst_max(Tree, Max, MaxTree).

/*Όταν κάνει unify με το n απλά αγνοήσε τα άλλα clauses και πλέον η πρώτη συνάρτηση */
find_max(n(T1,T2,T3), MaxIn, MaxOut) :-
	!, 
	find_max(T1, MaxIn, MaxIn1),
	find_max(T2, MaxIn1, MaxIn2),
	find_max(T3, MaxIn2, MaxOut).

find_max(T, MaxIn, MaxOut) :- 
	integer(T), 
	MaxOut is max(T, MaxIn).


subst_max(Int, Max, Max):- integer(Int).
subst_max(n(T1,T2,T3), MaxIn, n(MT1,MT2,MT3)) :-
	subst_max(T1, MaxIn, MT1),
	subst_max(T2, MaxIn, MT2),
	subst_max(T3, MaxIn, MT3).

/*-----------------------------------------------------------------------------------«*/
/*maximize with oen pass*/
/*-----------------------------------------------------------------------------------«*/

maximize(Tree, MaxTree):-
	max1_aux(Tree, 0, Max, Max, MaxTree).

max1_aux(Int, MaxIn, Max, MaxTree, MaxTree) :- integer(Int), Max is max(Int, MaxIn).

max1_aux(n(T1,T2,T3), MaxIn, Max, V, n(MT1,MT2,MT3)) :-
	max1_aux(T1, MaxIn, M1, V, MT1),
	max1_aux(T2, M1, M2, V, MT2),
	max1_aux(T3, M2, Max, V, MT3).


test(MaxTree) :-
	maximize(n(n(0,1,2),n(3,n(4,5,6),7),n(8,9,10)),MaxTree).