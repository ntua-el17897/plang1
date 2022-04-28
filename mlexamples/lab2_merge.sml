fun halve nil = (nil, nil)
| halve [a] = ([a], nil)
| halve (a::b::cs) = 
    let 
        val (x, y) = halve cs
    in
        (a::x, b::y)
    end 

fun merge (nil, ys) = ys
| merge (xs, nil) = xs
| merge (x::xs, y::ys) = 
if x < y then x :: merge (xs, y::ys)
else y :: merge (x::xs, ys)

fun mergeSort nil = nil
| mergeSort [a] = [a]
| mergeSort theList = 
    let 
        val (x, y) = halve theList
    in
        merge (mergeSort x, mergeSort y)
    end 

local
    fun sort l = ListMergesort.sort (op >) l
    
    fun get_first_gap n [] = n
      | get_first_gap n (x::xs) = if n = x then get_first_gap (n+1) xs else n;
in
(* fun smallest 2 = get_first_gap 0 *)
    fun smallest2 l = get_first_gap 0 (sort l)
end

local
    val testsuite = [
        ("empty", [], 0),
        ("zero", [0], 1),
        ("one", [1], 0), 
        ("upto3", [0, 1, 2, 3], 4), 
        ("reverse3", [3,2,1,0], 4)
]

    fun runtests f [] = ()
        | runtests f ((name, input, output) :: testcases) = (
            print ("Testcase " ^ name^": " );  
            if f input = output then print "OK\n"
            else                     print "FAILED!!!\n"; 
            runtests f testcases
            )
in 
    fun test_smallest f_smallest = runtests f_smallest testsuite
end 
