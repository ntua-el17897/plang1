(*val ratios = [0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094, 0.06966, 0.00153, 0.00772, 0.04025, 0.02406, 0.06749, 0.07507, 0.01929, 0.00095, 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.02360, 0.00150, 0.01974, 0.00074];
*)
val logVersion = [~1.520950, ~1.700027, ~1.664436, ~1.624433, ~1.406259, ~1.679662, ~1.685540, ~1.575228, ~1.552252, ~1.737481, ~1.720102, ~1.630593, ~1.674760, ~1.557950, ~1.538103, ~1.687917, ~1.739115, ~1.578062, ~1.569068, ~1.498033, ~1.665094, ~1.714343, ~1.676026, ~1.737565, ~1.686673, ~1.739707]


(*fun test x:real = (hd ratios) + x;*)



(*val logRatios = map log ratios;*)
(*fun checkIfLetter (c:char, n) = true;*)
fun checkIfLetter (c:char, n:int) = 
	let 
		val inputChar = ord c 
		val testCharLower = chr (ord #"a" + n)
		val testCharUpper = chr (ord #"A" + n)
	in	
		if (c = testCharUpper) orelse (c = testCharLower) then true 
		else false
	end;

fun countLetters([], _:int) = 0
	| countLetters (x::xs: char list, n: int) = 

	if checkIfLetter(x,n) then 1+countLetters(xs, n)
	else countLetters(xs, n);

fun everyLetter (input, n) =
	if n > 25 orelse n < 0 then []
	else countLetters(input, n)::everyLetter(input, n+1);

fun sumEveryLetter([]) = 0
	| sumEveryLetter (x::xs) =
	x+sumEveryLetter(xs); 

fun textRatios([], n) = []
	| textRatios(x::xs, n) = 
	(real(x)/real(n))::textRatios(xs, n);

fun convolution([], [], _) = 0.0
	| convolution(x::xs, y::ys, n) =
	if n = 0 then 0.0
	else ~(x*y)+convolution(xs, ys, n-1);

fun startAt(x::xs, n): real list= 
	if n = 0 then x::xs
	else startAt(xs, n-1);

fun minimum(x, y):real =
	if x > y then y
	else x; 

fun minimumPos(x, y, xPos, yPos):real =
	if x > y then yPos
	else xPos; 

fun createMinimumConv(x:real list, y:real list, n)=
	let 
		val curr = convolution(x, startAt(y,n), 25-n) + convolution(startAt(x,25-n), y, n)
	in 
		if n < 25 then curr::createMinimumConv(x, y, n+1)
		else [curr]
	end;

fun minInList [] = raise Empty
  | minInList [x] = x
  | minInList (x::xs) = minimum(x, minInList(xs));

fun positionInList ([], y, n) = raise Empty
	| positionInList (x::xs: real list , y: real, n) = 
		if x-y < 0.000001 then n 
		else positionInList(xs, y, n+1); 

fun checkIfSmall(c) = 
		if (c >= (#"a") andalso c<=(#"z")) then true 
		else false;


fun checkIfCapital(c) = 
		if (c >= (#"A") andalso c<=(#"Z")) then true 
		else false;

fun toTrueSmall(c: char, n) = 
	let 
		val offsetted = ord c - ord #"a" - n
	in 
		if offsetted < 0 then chr(offsetted + 26 + ord #"a")
		else chr(offsetted + ord #"a")
	end;

fun toTrueCapital(c: char, n) = 
	let 
		val offsetted = ord c - ord #"A" - n
	in 
		if offsetted < 0 then chr(offsetted + 26 + ord #"A")
		else chr(offsetted + ord #"A")
	end;


fun trueValue(c, n) = 
	if checkIfSmall(c) then toTrueSmall(c, n)
	else if checkIfCapital(c) then toTrueCapital(c, n)
	else c;

fun decrypting([], _) = []
	| decrypting (x::xs, offset) = 
	trueValue(x, offset)::decrypting(xs, offset);

fun decrypt(fileName) = 
	let 
		val infile = TextIO.openIn(fileName);
		val allFile = TextIO.inputAll infile;
		val test = explode(allFile);
		val testImplode = String.implode test;
		val testEveryLetter = everyLetter(test, 0);
		val testSumEveryLetter = sumEveryLetter(testEveryLetter);
		val testTextRatios = textRatios(testEveryLetter, testSumEveryLetter);
		val listOfConv = createMinimumConv(logVersion, testTextRatios, 0);
		val smallestInRatios = minInList(listOfConv);
		val something_weird = 0; 
		val positionOfSmallest = positionInList(listOfConv, smallestInRatios, 0);
		val answerExploded = decrypting(test, positionOfSmallest);
		val answerImploded = implode(answerExploded);
	in 
		print(answerImploded)
	end;

(*Testing metablhtes*)
(*val convTest = convolution(logVersion, testTextRatios, 25);*)

(*Θεωριτική main*)

(*val test_input="Lxx";
val infile = TextIO.openIn("msg2.txt");
val allFile = TextIO.inputAll infile;
val test = explode(allFile);
val testImplode = String.implode test;
val testEveryLetter = everyLetter(test, 0);
val testSumEveryLetter = sumEveryLetter(testEveryLetter);
val testTextRatios = textRatios(testEveryLetter, testSumEveryLetter);
val listOfConv = createMinimumConv(logVersion, testTextRatios, 0);
val smallestInRatios = minInList(listOfConv);
val something_weird = 0; 
val positionOfSmallest = positionInList(listOfConv, smallestInRatios, 0);
val answerExploded = decrypting(test, positionOfSmallest);
val answerImploded = implode(answerExploded);*)