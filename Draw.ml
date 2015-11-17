let init () =
	Graphics.set_color 0x000000;
	Graphics.set_line_width 3;
	(* Graphics.set_font "Comic Sans MS"; *)
	(* DRAWING RECTANGLE FOR STATS *)
	Graphics.draw_rect 0 550 296 47;
	Graphics.draw_rect 300 550 296 47;
	Graphics.draw_rect 0 499 296 47;
	Graphics.draw_rect 300 499 296 47;
	Graphics.set_text_size 82;
	Graphics.moveto 50 40;
	Graphics.draw_string "Eat";
	Graphics.draw_rect 0 30 296 47;
	Graphics.moveto 351 40;
	Graphics.draw_string "Thunder";
	Graphics.draw_rect 301 30 296 47;
	Graphics.moveto 50 91;
	Graphics.draw_string "Bath";
	Graphics.draw_rect 0 81 296 47;
	Graphics.moveto 351 91;
	Graphics.draw_string "Kill";
	Graphics.draw_rect 301 81 296 47;
	Graphics.moveto 50 5;
	Graphics.draw_string "Quit && Save game";
	Graphics.draw_rect 1 2 296 23;
	Graphics.moveto 351 5;
	Graphics.draw_string "Just quit";
	Graphics.draw_rect 301 2 296 23


let display_hp pv =
	Graphics.set_color 0x000000;
	Graphics.set_line_width 3;
	Graphics.moveto 50 563;
	Graphics.draw_string "Health";
	Graphics.set_color 0xffffff;
	Graphics.fill_rect 3 553 290 41;
	if (pv > 49) then
		Graphics.set_color 0x00ff00
	else if (pv > 19) then
		Graphics.set_color 0xffff00
	else
		Graphics.set_color 0xff0000;
	Graphics.fill_rect 3 553 (pv * 290 / 100) 41;
	Graphics.moveto 50 563;
	Graphics.set_color 0x000000;
	Graphics.draw_string ("Health : " ^ string_of_int pv)

let display_mp pv =
	Graphics.set_color 0x000000;
	Graphics.set_line_width 3;
	Graphics.set_color 0xffffff;
	Graphics.fill_rect 303 553 290 41;
	if (pv > 49) then
		Graphics.set_color 0x00ff00
	else if (pv > 19) then
		Graphics.set_color 0xffff00
	else
		Graphics.set_color 0xff0000;
	Graphics.fill_rect 303 553 (pv * 290 / 100) 41;
	Graphics.moveto 351 563;
	Graphics.set_color 0x000000;
	Graphics.draw_string ("Energy : " ^ string_of_int pv)

let display_hyg pv =
	Graphics.set_color 0x000000;
	Graphics.set_line_width 3;
	Graphics.set_color 0xffffff;
	Graphics.fill_rect 3 502 290 41;
	if (pv > 49) then
		Graphics.set_color 0x00ff00
	else if (pv > 19) then
		Graphics.set_color 0xffff00
	else
		Graphics.set_color 0xff0000;
	Graphics.fill_rect 3 502 (pv * 290 / 100) 41;
	Graphics.moveto 50 512;
	Graphics.set_color 0x000000;
	Graphics.draw_string ("Hygiene : " ^ string_of_int pv)

let display_hap pv =
	Graphics.set_color 0x000000;
	Graphics.set_line_width 3;
	Graphics.set_color 0xffffff;
	Graphics.fill_rect 303 502 290 41;
	if (pv > 49) then
		Graphics.set_color 0x00ff00
	else if (pv > 19) then
		Graphics.set_color 0xffff00
	else
		Graphics.set_color 0xff0000;
	Graphics.fill_rect 303 502 (pv * 290 / 100) 41;
	Graphics.moveto 351 512;
	Graphics.set_color 0x000000;
	Graphics.draw_string ("Happy : " ^ string_of_int pv)

let display_lvl pv =
	Graphics.set_color 0xffffff;
	Graphics.fill_rect 1 132 596 30;
	Graphics.set_color 0x00ffff;
	let x = (pv -. (float_of_int (int_of_float pv))) *. 587.
	in
	Graphics.fill_rect 4 138 (int_of_float x) 18;
	Graphics.set_color 0x000000;
	Graphics.draw_rect 1 135 593 24;
	Graphics.moveto 10 142;
	Graphics.draw_string ("Level : " ^ string_of_int (int_of_float pv))