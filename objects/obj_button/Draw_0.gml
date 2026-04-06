//draw_self();
//color text if selected

if (special_draw == false){
	if (draw_background) draw_sprite_ext(spr_button_frame,0,x,y-2,button_xscale,button_yscale,0,c_white,1);

	draw_set_font(fnt_game_gui_medium);
	if (selected == true){
		if (draw_background) draw_sprite_ext(spr_button_frame,3,x,y-2,button_xscale,button_yscale,0,c_white,1);
		if (place_meeting(x,y,obj_menu_cursor)){
			if (draw_background) draw_sprite_ext(spr_button_frame,2,x,y-2,button_xscale,button_yscale,0,c_white,1);
		}
		//var o = c_black;
		//draw_text_color(x+17,y,my_text,o,o,o,o,1);	
		//draw_text_color(x+15,y,my_text,o,o,o,o,1);	
		//draw_text_color(x+16,y+1,my_text,o,o,o,o,1);	
		//draw_text_color(x+16,y-1,my_text,o,o,o,o,1);	
		//var c = c_lime;
		//var c = #D2CB3E;
		//draw_text_color(x+16,y,my_text,c,c,c,c,1);	
	
		draw_text(x+my_text_x_offset,y+my_text_y_offset,my_text);
	}
	//normal - you can select it
	else if (selectable == true){
		if (place_meeting(x,y,obj_menu_cursor)){
			if (draw_background) draw_sprite_ext(spr_button_frame,2,x,y-2,button_xscale,button_yscale,0,c_white,1);
			//var o = c_black;
			//var o = #193054;
			//draw_text_color(x+17,y,my_text,o,o,o,o,.2);	
			//draw_text_color(x+15,y,my_text,o,o,o,o,.5);	
			//draw_text_color(x+16,y+1,my_text,o,o,o,o,.5);	
			//draw_text_color(x+16,y-1,my_text,o,o,o,o,.2);	
		
		
			//var c = #80D7E5;
			//draw_text_color(x+16,y,my_text,c,c,c,c,1);	
			draw_text(x+my_text_x_offset,y+my_text_y_offset,my_text);
		}
		else{
			draw_text(x+my_text_x_offset,y+my_text_y_offset,my_text);
		}
	}
	//can't select it
	else {
		if (draw_background) draw_sprite_ext(spr_button_frame,4,x,y-2,button_xscale,button_yscale,0,c_white,1);
		var c = c_dkgray;
		draw_text_color(x+my_text_x_offset,y+my_text_y_offset,my_text,c,c,c,c,1);	
	}
}
if (special_draw == true){
	
	//run your special draw code
	special_button_draw();
	
	
	
	
	
}