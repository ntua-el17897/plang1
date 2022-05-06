val ratios = [0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094, 0.06966, 0.00153, 0.00772, 0.04025, 0.02406, 0.06749, 0.07507, 0.01929, 0.00095, 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.02360, 0.00150, 0.01974, 0.00074];

val logVersion = [~3.904550990589445, ~2.6641290140442817, ~2.695775840226822, ~2.797865505424574, ~3.5906644066169813, ~4.205052684206522, ~2.760343995823344, ~2.8155797340448765, ~3.9251082449768013, ~6.482487543577793, ~2.063410724607308, ~2.589334267397226, ~3.948168452064499, ~2.4017426645272644, ~3.7272045684356043, ~3.8040658639230536, ~7.208860371766058, ~2.5050685416119527, ~3.157545569716595, ~3.5820000924868403, ~4.627415794935411, ~3.7465085669505727, ~3.2126452751175645, ~6.959048573369688, ~4.863940914945452, ~6.502290170873972]

val test_input="elsez";


fun test x:real = (hd ratios) + x;

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

(*fun convolution()*)
