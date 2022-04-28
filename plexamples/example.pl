parent(kim, holly).
parent(margaret, kim).
parent(margaret, kent).
parent(herbert, margaret).
parent(herbert, jeam).
parent(esther, margaret).


greatgrandparent(GGP, GGC):-
	parent(GGP, GP),
	parent(GP, P),
	parent(P, GGC),
	!.

ancestor(X,Y):- parent(X,Y).