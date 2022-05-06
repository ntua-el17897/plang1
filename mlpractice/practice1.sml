type vec = real*real;

fun gcd(m,n) = 
	if m = 0 then n
	else gcd(n mod m, m);

fun length [] = 0
	| length (x::xs) = 1 + length xs;

fun double(n) = 2*n;
fun f u = Math.sin(u)/u;
fun g k = ~k * k;

fun sign(n) =
	if n>0 then 1
	else if n=0 then 0
	else ~1;

fun isLower c = #"a" <= c andalso c <= #"z";

fun lengthvec (x,y) = Math.sqrt(x*x + y*y);

fun negvec (x,y) : real*real = (~x, ~y);

fun average(x,y) = (x+y)/2.0;

fun addvec ((x1, y1), (x2,y2)) : vec = (x1+x2, y1+y2);

(* fun whichIsFirst ((hours1: int, min1: int, str1: string), (hours2: int, min2: int, str2: string)) = 
	if str1 = "AM" andalso str2 = "PM" then (hours1, min1, str1)
	else if str2 = "AM" andalso str1 = "PM" then (hours2, min2, str2)
	else if (str1 = "PM" andalso str2 = "PM") or (str2 = "AM" andalso str1 = "AM") then 
		if hours1 > hours2 then (hours1, min1, str1)
		else if hours1 < hours2 then (hours2, min2, str2)
		else if hours2 = hours1 then 
			if min1 >= min2 then (hours1, min1, str1)
			else if min2 > min1 then (hours2, min2, str2);
 *)

fun whichIsFirst ((hours: int, min: int, str: string), (hours: int, min: int, str: string)):string = "both"
	| whichIsFirst ((_: int, _: int, "AM"), (_: int, _: int, "PM")):string = "first"
	| whichIsFirst ((_: int, _: int, "PM"), (_: int, _: int, "AM")):string = "second";
	| whichIsFirst ((h1: int, _: int, str: string), (h2: int, _:int, str: string)):string = if h1 > h2 then "first" else if h1 < h2 then "second" else "both"
	| whichIsFirst ((h: int, min1: int, str: string), (h: int, min2: int, str: string)):string =
	if min1 > min2 then "first" else if min1 < min2 then "second" else "both";


fun lastElement (xs::[]) = xs
	| lastElement (xs::x) = lastElement(x);

(* explode "Banquo" *)
