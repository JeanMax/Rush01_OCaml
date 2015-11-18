(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: mcanal <zboub@42.fr>                       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/11/14 18:26:06 by mcanal            #+#    #+#             *)
(*   Updated: 2015/11/18 17:38:31 by mcanal           ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)


let doSomething tama = function
	(0, 0) -> tama
  | (x, y) when x >= 0 && x <= 300 && y >= 0 && y < 30 -> tama#save_exit; tama
  | (x, y) when x > 300 && x <= 600 && y >= 0 && y < 30 -> exit 2
  | (x, y) when x >= 0 && x < 300 && y >= 30 && y <= 80 -> tama#eat
  | (x, y) when x >= 300 && x < 600 && y >= 30 && y <= 80 -> tama#thunder
  | (x, y) when x >= 0 && x < 300 && y >= 80 && y <= 130 -> tama#bath
  | (x, y) when x >= 300 && x < 600 && y >= 80 && y <= 130 -> tama#kill
  | _ -> tama


let checkEvent ()=
  let sleep x =
	try ignore (Unix.select [] [] [] x) with _ -> () in
  let rec zboub i xy =
	sleep 0.1;
	if i > 0. then begin
		if xy != (0, 0) && (Graphics.button_down ())
		then zboub (i-.0.12) (Graphics.mouse_pos ()) else zboub (i-.0.12) xy end
	else xy in zboub 1. (0, 0)

			  
let rec gameloop tama lvl =
(*  tama#debug; *)
  Draw.display_lvl (tama#get_lvl);
  Draw.display_hp (tama#get_hp);
  Draw.display_mp (tama#get_mp);
  Draw.display_hyg (tama#get_hyg);
  Draw.display_hap (tama#get_hap);
  let tama = doSomething tama (checkEvent ()) in

  if lvl != tama#get_lvl
  then begin Graphics.set_color 0xffffff; 
			 Graphics.fill_rect 0 172 600 320; 
			 Images.dessiner_image tama#get_img 166 174 end;
  
  if tama#is_alive = true then gameloop tama#live tama#get_lvl else ()


let rec askLoad () =
  print_endline "Load previously saved game?! (y/n)";
  let s = read_line () in
  if String.length s = 0 then askLoad ()
  else
	match s.[0] with
	  'y' -> print_endline "PIKAAAAAAAAAA!"; true
	| 'n' -> print_endline "pika pika ):"; false
	| _   -> askLoad ()


let rec askPoke () =
  print_endline "Which pokemon do you want?! (Pika/Sala)";
  let s = Tama.poke_of_string (read_line ()) in
  if s = Tama.Fail then askPoke () else s

let () =
  let tama = if askLoad () = true
			 then (new Tama.tama Tama.Pika)#load
			 else (new Tama.tama (askPoke ())) in

  Graphics.open_graph " 600x600";
  Draw.init ();
  gameloop tama 0.;
  print_endline "GAME OVER"
