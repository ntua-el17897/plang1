(*Ερώτημα Α*)
fun mangle_help (_, _, []) = []
	|mangle_help (f, g, lst) = 
	let
		val h1 = f (hd lst)
		val h2 = g (hd (tl lst))
		val tailed = tl (tl lst)
	in
		h1::h2::mangle_help(f, g, tailed)
	end


fun mangle (_, _, []) = []
	|mangle (f, g, lst) = 
	let
		val mlst = mangle_help(f,g,lst)
		val tailed = tl (tl lst) 
		val h1 = hd mlst
		val h2 = hd (tl mlst)
	in
		h1::h2::mangle(f,g,tailed)
	end

val test = [1,2,3,4]
fun f x = x * x
fun g x = x + x
(*val testing = mangle(f,g,test)*)


(*Ερώτημα Β*)

fun help1(_, _, []) = []
	|help1(f, lst, input) =
	let
		val head1 = hd input
		val f1 = f head1
	in
		map(f1, lst)::help1(f,lst, (tl input))
	end

fun mapAllpairs(_, []) = []
	|mapAllpairs(f, lst) = help1(f, lst, lst)

(*val f (x,y) = (x, y)*)
val test=[1,2,3]
(*mapAllpairs(fn  (x,y) = (x, y),test)*)

