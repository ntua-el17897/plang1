local
    fun elem (num:int) [] = false
        | elem (num:int) (x::xs) = if x = num then true else elem num xs; 

    fun loop num l = if elem num l then loop (num + 1) l else num 
in
    fun smallest l = loop 0 l  
end

(* [3,5,5,0,1] -> [0,1,3,4,5]*)

(* no:
* 1. 0 not in list => then 0 is the answer
* 2. 0 is in list => [0,|L|-1] => |L|
*)

(* O(|L|*log|L|)*)

