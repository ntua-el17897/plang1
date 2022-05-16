

fun min_fill(filename) = 
	let 
		fun readInt input = 
			Option.valOf (TextIO.scanStream (Int.scan StringCvt.DEC) input);

		fun readEdges(infile) = 
			let 
				val node1 = readInt infile;
				val node2 = readInt infile; 
				val weight = readInt infile; 
				val sth1 = TextIO.input1 infile;
			in 
				if TextIO.endOfStream(infile) then [[weight, node1, node2]]
				else [weight,node1,node2]::readEdges(infile)
			end;

		fun mergesort [] = []
		    | mergesort [a] = [a]
		    | mergesort (x) = 
		    let 
		        fun halve nil = (nil, nil)
		        | halve [a] = ([a], nil)
		        | halve (a::b::cs) = 
		        let
		            val (x,y) = halve cs
		        in
		            (a::x, b::y)
		        end
		        val (a,b) = halve x

		        fun merge ([],[]) = []
		            | merge (fs,[]) = fs
		            | merge ([],gs) = gs
		            | merge (f::fs,g::gs) =
		                if (hd f < hd g) then f :: merge(fs, g::gs)
		                            else g :: merge (f::fs,gs) 
		    in merge (mergesort a, mergesort b)
			end;

		fun findSet(i, union) = 
			if i = Array.sub(union, i) then i
			else findSet(Array.sub(union,i),union);

		fun unionSet(union, u, v) = 
			Array.update(union, u, Array.sub(union, v));

		fun kruskal ([], _,_) = []
			| kruskal (edges, union, max) =
			let 
				val edgesHd = hd edges;
				val weight = hd edgesHd;
				val u = hd(tl edgesHd);
				val v = hd(tl(tl edgesHd));
				val uRep = findSet(u, union);
				val vRep = findSet(v, union);
			in
				if uRep <> vRep then (
							if !max < weight then 
								max := weight 
							else max := !max;
							unionSet(union, u, v);
							edgesHd::kruskal(tl edges, union, max))
				else kruskal(tl edges, union, max)
			end;
		val infile = TextIO.openIn(filename);
		val noNodes = readInt infile;
		val noEdges = readInt infile;
		val union = Array.array(noNodes+1, 0);
		val i = ref 0;
		val _ = while (!i) <> noNodes do (i := !i+1; Array.update(union, !i, !i));

		val _ = unionSet(union, 4, 2);
		val testFindSet = findSet(4, union);

		val edges = readEdges(infile);
		val sortEdges = mergesort edges;
		val max = ref 0;
		val testKruskal = kruskal(sortEdges, union, max);
	in
		print(Int.toString (!max))
	end;

