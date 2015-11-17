let display_hp pv =
	Graphics.set_color 0x000000;
	Graphics.set_line_width 3;
	Graphics.draw_rect 0 550 296 47;
	Graphics.set_color 0xffffff;
	Graphics.fill_rect 3 553 290 41;
	if (pv > 49) then
		Graphics.set_color 0x00ff00
	else if (pv > 19) then
		Graphics.set_color 0xffff00
	else
		Graphics.set_color 0xff0000;
	Graphics.fill_rect 3 553 (pv * 290 / 100) 41

let display_mp pv =
	Graphics.set_color 0x000000;
	Graphics.set_line_width 3;
	Graphics.draw_rect 300 550 296 47;
	Graphics.set_color 0xffffff;
	Graphics.fill_rect 303 553 290 41;
	if (pv > 49) then
		Graphics.set_color 0x00ff00
	else if (pv > 19) then
		Graphics.set_color 0xffff00
	else
		Graphics.set_color 0xff0000;
	Graphics.fill_rect 303 553 (pv * 290 / 100) 41

let display_hyg pv =
	Graphics.set_color 0x000000;
	Graphics.set_line_width 3;
	Graphics.draw_rect 0 499 296 47;
	Graphics.set_color 0xffffff;
	Graphics.fill_rect 3 502 290 41;
	if (pv > 49) then
		Graphics.set_color 0x00ff00
	else if (pv > 19) then
		Graphics.set_color 0xffff00
	else
		Graphics.set_color 0xff0000;
	Graphics.fill_rect 3 502 (pv * 290 / 100) 41

let display_hap pv =
	Graphics.set_color 0x000000;
	Graphics.set_line_width 3;
	Graphics.draw_rect 300 499 296 47;
	Graphics.set_color 0xffffff;
	Graphics.fill_rect 303 502 290 41;
	if (pv > 49) then
		Graphics.set_color 0x00ff00
	else if (pv > 19) then
		Graphics.set_color 0xffff00
	else
		Graphics.set_color 0xff0000;
	Graphics.fill_rect 303 502 (pv * 290 / 100) 41