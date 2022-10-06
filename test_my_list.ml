type 'a my_list = 
| Nil
| Cons of 'a * 'a my_list;;

let string_of_my_list str_fun l = 
  let rec string_content = function
    | Nil  -> "Nil"
    | Cons(x,Nil)  -> "Cons(" ^ (str_fun x) ^ " , Nil)"
    | Cons(x, q) -> "Cons(" ^ (str_fun x) ^ ", " ^ (string_content q) ^ ")"
  in (string_content l);;

let string_of_nat_my_list = string_of_my_list string_of_int;;

let string_of_string_my_list = string_of_my_list (fun x -> x);;

let hd l = match l with
| Nil -> failwith "liste vide"
| Cons (x, q) -> x;;

let tl l = match l with
| Nil -> Nil
| Cons(x, q) -> q;;

let rec length l = match l with
| Nil -> 0 
| Cons(x, q) -> 1 + (length q);;

let rec map f l = match l with
| Nil -> Nil
| Cons(x, q) -> Cons(f x, map f q);;