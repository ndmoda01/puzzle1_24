my_text = "Credits";
my_text_x_offset = 28;
activate_button = function(){
	//instance_create_depth(x,y,-1000,obj_room_transition);
	//room_goto(rm_credits);
	scr_room_goto_transition(rm_credits);
}

special_draw = true;
text_x = (room_width/2)+1;

special_button_draw = function(){
	
	draw_sprite_stretched(spr_button_frame,0,x+2,y,140,26);
	if (place_meeting(x,y,obj_menu_cursor)) draw_sprite_stretched(spr_button_frame,2,x+2,y,140,26);
	
	scribble("[fa_center][fa_top][fnt_game_gui_main_menu]"+my_text).draw(text_x,y);
	
}