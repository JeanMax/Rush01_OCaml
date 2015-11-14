(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Tama.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mcanal <zboub@42.fr>                       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/11/14 19:19:38 by mcanal            #+#    #+#             *)
(*   Updated: 2015/11/14 22:23:13 by mcanal           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class tama ?(hp=100) ?(mp=100) ?(hyg=100) ?(hap=100) () =
object

  val _hp = hp
  val _mp = mp
  val _hyg = hyg
  val _hap = hap
  val _is_alive = hp > 0 && mp > 0 && hyg > 0 && hap > 0

  method get_hp = _hp
  method get_mp = _mp
  method get_hyg = _hyg
  method get_hap = _hap
  method is_alive = _is_alive
					
  method debug = Printf.printf "hp:%d mp:%d hyg:%d hap:%d alive:%b\n"
							   _hp _mp _hyg _hap _is_alive;
				 flush stdout

  method eat = new tama ~hp:(_hp+25) ~mp:(_mp-10) ~hyg:(_hyg-20) ~hap:(_hap+5) ()
  method thunder = new tama ~hp:(_hp-20) ~mp:(_mp+25) ~hyg:_hyg ~hap:(_hap-20) ()
  method bath = new tama ~hp:(_hp-20) ~mp:(_mp-10) ~hyg:(_hyg+25) ~hap:(_hap+5) ()
  method kill = new tama ~hp:(_hp-20) ~mp:(_mp-10) ~hyg:_hyg ~hap:(_hap+20) ()

  method live = new tama ~hp:(_hp-1) ~mp:(_mp) ~hyg:(_hyg) ~hap:(_hap) ()
					
  method save_exit =
	let oc = open_out "save.itama" in
	Printf.fprintf oc "%d;%d;%d;%d" _hp _mp _hyg _hap;
	close_out oc;
	ignore (exit 0)
	
  method load =
	try
	  let ic = open_in "save.itama" in
	  let l = Str.split (Str.regexp ";") (input_line ic) in
	  close_in ic;
	  new tama  ~hp:(int_of_string (List.nth l 0))
				~mp:(int_of_string (List.nth l 1))
				~hyg:(int_of_string (List.nth l 2))
				~hap:(int_of_string (List.nth l 3)) ()			   
	with _ -> new tama ()

end
