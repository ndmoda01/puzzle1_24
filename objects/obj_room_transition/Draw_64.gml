
// You can write your code in this editor
if (live_call()) return live_result;

if (screen_saved == false){
	screen_save("previous_screen.png");
	screen_saved = true;
	prev_screenshot = sprite_add("previous_screen.png",1,false,false,0,0);
}

//if (target_room != noone) and (moved_room == false){
//	room_goto(target_room);
//	moved_room = true;
//}

//get width and height of screenshot
var _screenshot_w = sprite_get_width(prev_screenshot);
var _screenshot_h = sprite_get_height(prev_screenshot);

//determine the ratio of the difference between gui and screenshot dimensions
//this will tell you how much the image will need to be scaled to fit in gui
var _ss_gui_ratio_w = display_gui_w / _screenshot_w;
var _ss_gui_ratio_h = display_gui_h / _screenshot_h;

var _gui_ss_ratio_w = _screenshot_w / display_gui_w;
var _gui_ss_ratio_h = _screenshot_h / display_gui_h;

switch(transition_type){
	case ROLL_RTL:
	
		//draw part of the screen when moving over it
		//draw_sprite_part(prev_screenshot,0,0,0,x,view_height,0,0);
		//draw_sprite_part_ext(prev_screenshot,0,0,0,x,view_height*height_adjust,0,0,_ss_gui_ratio_w,_ss_gui_ratio_h,c_white,1);
		
		//x has to be slowed down on this draw or it goes too fast at low widths and too slow at higher widths
		draw_sprite_part_ext(prev_screenshot,0,0,0,x*_gui_ss_ratio_w,window_size_h,0,0,_ss_gui_ratio_w,_ss_gui_ratio_h,c_white,1);


		//draw_sprite_ext(transition_sprite,0,x,view_height/2,scale,scale,image_angle,c_white,1);
		draw_sprite_ext(transition_sprite,0,x,view_height/2,scale,scale,image_angle,c_white,1);

		x -= spd;
		image_angle+= rotate_spd;

		var _end_x = sprite_width_buffer;
	
		if (x < -_end_x){finished = true;};
	break;

	case ROLL_LTR:
		//draw part of the screen when moving over it
		//don't draw background moving while transition object is off the left side of the screen
		if (x <= 0){
			//draw_sprite_part(prev_screenshot,0,0,0,view_width,view_height,0,0);
			draw_sprite_part_ext(prev_screenshot,0,0,0,window_size_w,window_size_h,0,0,_ss_gui_ratio_w,_ss_gui_ratio_h,c_white,1);
		}
		else{
			//draw_sprite_part(prev_screenshot,0,x,0,view_width,view_height,x,0);
			draw_sprite_part_ext(prev_screenshot,0,x*_gui_ss_ratio_w,0,window_size_w,window_size_h,x,0,_ss_gui_ratio_w,_ss_gui_ratio_h,c_white,1);
		}
		
		draw_sprite_ext(transition_sprite,0,x,view_height/2,scale,scale,image_angle,c_white,1);

		x += spd;
		image_angle-= rotate_spd;

		var _end_x = (display_gui_w)+sprite_width_buffer;
	
		if (x > _end_x){finished = true;};
	break;
	
	//line from top to bottom
	case LINE_TTB:
		
		//don't move the sprite when outside the top side of the view
		if ( y <= 0){
			//draw_sprite_part(prev_screenshot,0,0,0,view_width,view_height,0,0);
			draw_sprite_part_ext(prev_screenshot,0,0,0,window_size_w,window_size_h,0,0,_ss_gui_ratio_w,_ss_gui_ratio_h,c_white,1);
		}
		else{
			//draw part of the screen when moving over it
			//draw_sprite_part(prev_screenshot,0,0,y,view_width,view_height,0,y);
			draw_sprite_part_ext(prev_screenshot,0,0,y*_gui_ss_ratio_h,window_size_w,window_size_h,0,y,_ss_gui_ratio_w,_ss_gui_ratio_h,c_white,1);
		}
		
		//draw items in a line that will cover the seam
		var _start_x = 0;
		var _width_buffer = sprite_width_buffer/2;
		
		for (var i = 0; i < array_length(transition_sprite_array); i++){
			
			draw_sprite_ext(transition_sprite_array[i,0],0,_start_x+(_width_buffer*i),y+transition_sprite_array[i,1],scale,scale,image_angle*transition_sprite_array[i,2],c_white,1);
		}

		y += spd;
		image_angle +=rotate_spd;

		if (y > (display_gui_h + sprite_height_buffer)){finished = true;}
		
	break;
	
	case LINE_BTT:
		//prev screen sprite
		//draw_sprite_part(prev_screenshot,0,0,0,view_width,y,0,0);
		draw_sprite_part_ext(prev_screenshot,0,0,0,window_size_w,y*_gui_ss_ratio_h,0,0,_ss_gui_ratio_w,_ss_gui_ratio_h,c_white,1);
		
		//draw items in a line that will cover the seam
		var _start_x = 0;
		var _width_buffer = sprite_width_buffer/2;
		
		for (var i = 0; i < array_length(transition_sprite_array); i++){
			
			draw_sprite_ext(transition_sprite_array[i,0],0,_start_x+(_width_buffer*i),y-transition_sprite_array[i,1],scale,scale,image_angle*transition_sprite_array[i,2],c_white,1);
		}

		y -= spd;
		image_angle +=rotate_spd;

		if (y < 0-sprite_height_buffer){finished = true;}
	break;
	
	
}

if (finished == true){ instance_destroy();}

if (moved_room == false) and (target_room != noone){
	room_goto(target_room);
	moved_room = true;
}
//if(keyboard_check(vk_f12)){
//	draw_sprite(prev_screen,0,0,0);	
//}
//if(keyboard_check(vk_f11)){
//	instance_destroy();
//}

