// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_new_high_score_detected(){
	var _view_width = view_get_wport(0);
	var _view_height = view_get_hport(0);
	//draw_set_halign(fa_center);
	//var  d = #320011;
	//draw_text_color(view_get_wport(0)/2, 882, "NEW HIGH SCORE!",d,d,d,d,1);
	//draw_text_color(view_get_wport(0)/2, 878, "NEW HIGH SCORE!",d,d,d,d,1);
	//draw_text_color((view_get_wport(0)/2)-3, 880, "NEW HIGH SCORE!",d,d,d,d,1);
	//draw_text_color((view_get_wport(0)/2)+3, 880, "NEW HIGH SCORE!",d,d,d,d,1);
	//var  c = #ece8c2;
	//draw_text_color(view_get_wport(0)/2, 880, "NEW HIGH SCORE!",c,c,c,c,1);
	//draw_text(view_get_wport(0)/2, view_get_hport(0)-80, "NEW HIGH SCORE!");
	//draw_set_halign(fa_left);
	
	if (room == rm_ending){
		scribble("[fa_center][fa_middle][fnt_game_gui_largest_2]NEW HIGH SCORE!").draw((_view_width/2)+3,(_view_height/2)+321);
	}
	else {	
		scribble("[fa_center][fa_middle][fnt_game_gui_largest_2]NEW HIGH SCORE!").draw((_view_width/2)+3,(_view_height/2)+270);
	}
	
	high_score_state = "register";
	
	if (alarm[0] < 0){			
		if (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_anykey)){
			//room_goto(rm_high_scores);
			scr_room_goto_transition(rm_high_scores);
		}
	}
}