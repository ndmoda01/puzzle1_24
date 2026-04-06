if (live_call()) return live_result;
if (obj_game.game_type == BLOCKOUT) exit;
if (obj_game.game_type == COLOR_CLASH) exit;

//get current x in room and current camera x
var _x = x;
var _y = y;
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

//calulate the distance from x to cam x
var _x_offset = x - _cam_x;
var _y_offset = y - _cam_y;

//calculate offset percentage
//the camera_get_view_width / height function's argument needed to be changed to view_camera[0]
var _x_offset_percent = _x_offset / camera_get_view_width(view_camera[0]);
var _y_offset_percent = _y_offset / camera_get_view_height(view_camera[0]);

//multiply percent offset by display size to get gui position
var _gui_x = _x_offset_percent*display_get_gui_width();
var _gui_y = _y_offset_percent*display_get_gui_height();

var _apparent_item_size = (16*3)/2;
var _my_score = my_score;
var _cam_width = camera_get_view_width(view_camera[0]);

//3 digit score offsets
if (my_score > 99 and my_score <= 999){
	draw_set_font(fnt_game_gui_largest);
	
	switch(_cam_width){
		case 640:
			draw_text(_gui_x+6,_gui_y+10, _my_score); 
		break;
		case 480:
			draw_text(_gui_x+14,_gui_y+19, _my_score); 
		break;
		case 384:
			draw_text(_gui_x+22,_gui_y+28, _my_score); 
		break;
		case 320:
			draw_text(_gui_x+30,_gui_y+34, _my_score); 
		break;
	}
}
//4 digit score offsets
else if (my_score > 999 and my_score <= 9999){
	draw_set_font(fnt_game_gui_med_large_2);
	
	switch(_cam_width){
		case 640:
			draw_text(_gui_x+2,_gui_y+11, _my_score); 
		break;
		case 480:
			draw_text(_gui_x+8,_gui_y+19, _my_score); 
		break;
		case 384:
			draw_text(_gui_x+18,_gui_y+28, _my_score); 
		break;
		case 320:
			draw_set_font(fnt_game_gui_largest);
			draw_text(_gui_x+25,_gui_y+34, _my_score); 
		break;
	}
}
//5 digit score offsets
else if (my_score > 9999 and my_score <= 99999){
	draw_set_font(fnt_game_gui_med_large);
	
	switch(_cam_width){
		case 640:
			draw_text(_gui_x+2,_gui_y+12, _my_score); 
		break;
		case 480:
			draw_text(_gui_x+8,_gui_y+19, _my_score); 
		break;
		case 384:
			draw_text(_gui_x+18,_gui_y+28, _my_score); 
		break;
		case 320:
			draw_set_font(fnt_game_gui_largest);
			draw_text(_gui_x+25,_gui_y+34, _my_score); 
		break;
	}
}

//2 digit score offsets
else{
	draw_set_font(fnt_game_gui_extra_largest);
	
	//change buffer amount depending on camera zoon so that score is always roughly in the middle
	switch(_cam_width){
		case 640:
			//default cam 640x360
			draw_text(_gui_x+10,_gui_y+8,_my_score);
		break;
		case 480:
			draw_text(_gui_x+17,_gui_y+16,_my_score);
		break;
		case 384:
			draw_text(_gui_x+26,_gui_y+23, _my_score); 
		break;
		case 320:
			//zoom x2 cam 320x180
			draw_text(_gui_x+34,_gui_y+32,_my_score);
		break;
	}
}

my_lifespan--;
if (my_lifespan <= 0){
	instance_destroy()
};

draw_set_font(fnt_game_gui);