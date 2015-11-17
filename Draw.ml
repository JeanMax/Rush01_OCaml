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
	Graphics.moveto 50 10;
	Graphics.draw_string "Eat";
	Graphics.draw_rect 0 0 296 47;
	Graphics.moveto 351 10;
	Graphics.draw_string "Thunder";
	Graphics.draw_rect 301 0 296 47;
	Graphics.moveto 50 61;
	Graphics.draw_string "Bath";
	Graphics.draw_rect 0 51 296 47;
	Graphics.moveto 351 61;
	Graphics.draw_string "Kill";
	Graphics.draw_rect 301 51 296 47

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
	Graphics.draw_string "Health"

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
	Graphics.draw_string "Energy"

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
	Graphics.draw_string "Hygiene"

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
	Graphics.draw_string "Happy"