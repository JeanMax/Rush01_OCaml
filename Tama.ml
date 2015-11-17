(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Tama.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mcanal <zboub@42.fr>                       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/11/14 19:19:38 by mcanal            #+#    #+#             *)
(*   Updated: 2015/11/17 18:27:26 by mcanal           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = Pika | Sala | Fail

let string_of_poke = function
	Pika -> "Pika"
  | Sala -> "Sala"
  | Fail -> "Ratatat"

let poke_of_string = function
    "Pika" | "pika" | "PIKA" -> print_endline "PIKA PIKA!!"; Pika
  | "Sala" | "sala" | "SALA" -> print_endline "SALA SALA!!"; Sala
  | _ -> Fail

class tama ?(stats=(100,100,100,100)) ?(lvl=0.) poke =
object

  val _hp =  match stats with (hp,_,_,_)  -> if hp > 100 then 100 else hp
  val _mp =  match stats with (_,mp,_,_)  -> if mp > 100 then 100 else mp
  val _hyg = match stats with (_,_,hyg,_) -> if hyg > 100 then 100 else hyg
  val _hap = match stats with (_,_,_,hap) -> if hap > 100 then 100 else hap
  val _lvl = lvl
  val _poke = poke
  val _is_alive = match stats with 
	  (hp,mp,hyg,hap) when hp > 0 && mp > 0 && hyg > 0 && hap > 0 -> true
	| _ -> false
  val _img = match poke with
	  Sala  -> if lvl < 7. then Images.lire_image "img/sala.jpg"
			   else if lvl < 9. then Images.lire_image "img/rept.png"
			   else Images.lire_image "img/drac.png" (*TODO: catch error?*)
	|  _    -> if lvl < 7. then Images.lire_image "img/pika.png"
			   else Images.lire_image "img/raichu.jpg" (*TODO: catch error?*)

  method get_hp = _hp
  method get_mp = _mp
  method get_hyg = _hyg
  method get_hap = _hap
  method get_lvl = _lvl
  method is_alive = _is_alive
  method get_img = _img
					
  method debug = Printf.printf 
				   "hp:%d mp:%d hyg:%d hap:%d lvl:%f poke:%s alive:%b\n"
				   _hp _mp _hyg _hap _lvl (string_of_poke _poke) _is_alive;
				 flush stdout

  method eat = new tama ~stats:(_hp+25, _mp-10, _hyg-20, _hap+5) 
				   ~lvl:(_lvl+.0.5) poke
  method thunder = new tama ~stats:(_hp-20, _mp+25, _hyg, _hap-20) 
					   ~lvl:(_lvl+.0.5) poke
  method bath = new tama ~stats:(_hp-20, _mp-10, _hyg+25, _hap+5) 
					~lvl:(_lvl+.0.5) poke
  method kill = new tama ~stats:(_hp-20, _mp-10, _hyg, _hap+20) 
					~lvl:(_lvl+.0.5) poke

  method live = new tama ~stats:(_hp-1, _mp, _hyg, _hap) 
					~lvl:(_lvl+.0.1) poke
					
  method save_exit =
	let oc = open_out "save.itama" in
	Printf.fprintf oc "%d;%d;%d;%d;%f;%s" 
				   _hp _mp _hyg _hap _lvl (string_of_poke poke);
	close_out oc;
	ignore (exit 0)
	
  method load =
	try
	  let ic = open_in "save.itama" in
	  let l = Str.split (Str.regexp ";") (input_line ic) in
	  close_in ic;
	  new tama  ~stats:(int_of_string (List.nth l 0),
						int_of_string (List.nth l 1),
						int_of_string (List.nth l 2),
						int_of_string (List.nth l 3))
		  ~lvl:(float_of_string (List.nth l 4))
		  (poke_of_string (List.nth l 5))
	with _ -> new tama Pika

end
