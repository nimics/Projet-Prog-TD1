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

(** Test **)

let empty = Nil in
let one = Cons("a", Nil) in 
let lst = Cons(1, Cons(3, Cons(6, Cons(10, Cons(15, Cons(21, Cons(28, Cons(36, Cons(45, Cons(55, Nil)))))))))) in

let test_hd () = 
  Printf.printf "Tête de %s : %s.\n" (string_of_string_my_list one) (hd one);
  Printf.printf "Tête de %s : %d.\n\n" (string_of_nat_my_list lst) (hd lst)

in let test_tl () = 
  Printf.printf "Queue de %s : %s.\n" (string_of_string_my_list one) (string_of_string_my_list (tl one));
  Printf.printf "Queue de %s : %s.\n\n" (string_of_nat_my_list lst) (string_of_nat_my_list (tl lst))

in let test_length () = 
  Printf.printf "Taille de %s : %d.\n" (string_of_string_my_list one) (length one);
  Printf.printf "Taille de %s : %d.\n" (string_of_nat_my_list lst) (length lst);
  Printf.printf "Taille de %s : %d.\n\n" (string_of_string_my_list empty) (length empty)

in let test_map ()= 
  Printf.printf "Map de (x -> xx) sur %s : %s.\n" (string_of_string_my_list one) (string_of_string_my_list (map (fun s -> s ^ s) one));
  Printf.printf "Map de (x -> 2x) sur %s : %s.\n" (string_of_nat_my_list lst) (string_of_nat_my_list (map (fun n -> 2 * n) lst));
  Printf.printf "Map de (x -> 2x) sur %s : %s.\n\n" (string_of_nat_my_list empty) (string_of_nat_my_list (map (fun n -> 2 * n) empty));

in test_hd(); test_tl(); test_length(); test_map()