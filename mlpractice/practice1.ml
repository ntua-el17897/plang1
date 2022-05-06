fun gcd(m,n) = 
	if m = 0 then n
	else gcd(n mod m, m);

fun length [] = 0
	| length (x::xs) = 1 + length xs;

