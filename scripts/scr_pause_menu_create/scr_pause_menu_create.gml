function scr_pause_menu_create(){
	
	//these button coordinates need to be based on original room size dimensions, NOT GUI
	var _x = room_width/2 - 40;
		
	instance_create_layer(_x-20,160,"Instances_1", obj_menu_cursor);	
			
	//resume
	//var _resume = instance_create_layer(_x-15,40,"Instances_2",obj_button);
	var _resume = instance_create_layer(_x-8,128,"Instances_2",obj_button);
	_resume.my_text = "Resume Game";
	_resume.image_yscale = .5;
	_resume.sprite_index = spr_button;
	_resume.activate_button = function(){
			instance_activate_all();
			paused = false;
			pause_buttons_created = false;
			pause_control_display = false;
			instance_destroy(obj_button);
			if (instance_exists(obj_menu_cursor)){
				instance_destroy(obj_menu_cursor);
			};
				
			//turn on background
			var _til1, _til2;
			if (layer_exists("Tiles_1")){
				_til1 = layer_get_id("Tiles_1");	
				layer_set_visible(_til1,true);
			}
			//turn off background
			if (layer_exists("Tiles_2")){
				_til2 = layer_get_id("Tiles_2");	
				layer_set_visible(_til2,true);
			}
		}
				
	_resume.special_draw = true;
	_resume.special_button_draw = function(){
		
			draw_sprite_stretched(spr_button_frame,0,(room_width/2)-70,128,140,24);
			//seems to be an issue with the place meeting function. Not sure why as it works in the main menu this way fine
			//if (place_meeting(x,y,obj_menu_cursor)) draw_sprite_stretched(spr_button_frame,2,(room_width/2)-70,128,140,24);
			//currently checking to see if the cursor is at the location specified in it's position array to draw the highlighted frame
			if (instance_exists(obj_menu_cursor)) and (obj_menu_cursor.y == 128) draw_sprite_stretched(spr_button_frame,2,(room_width/2)-70,128,140,24);
			scribble("[fa_center][fa_top][fnt_game_gui_largest]Resume Game").draw((room_width/2)+1,128);	
	}
			
	//end run (resume but end the current session)
	var _end_run = instance_create_layer(_x-8,173,"Instances_2",obj_button);
	_end_run.my_text = "End Game";
	_end_run.image_yscale = .5;
	_end_run.activate_button = function(){
		instance_activate_all();
		paused = false;
		pause_buttons_created = false;
		pause_control_display = false;
		instance_destroy(obj_button);
		if (instance_exists(obj_menu_cursor)){
			instance_destroy(obj_menu_cursor);
		};
				
		//turn on background
		var _til1, _til2;
		if (layer_exists("Tiles_1")){
			_til1 = layer_get_id("Tiles_1");	
			layer_set_visible(_til1,true);
		}
		//turn off background
		if (layer_exists("Tiles_2")){
			_til2 = layer_get_id("Tiles_2");	
			layer_set_visible(_til2,true);
		}
				
		game_over = true;
		alarm[0] = SEC*5;
	}
	
	_end_run.special_draw = true;
	_end_run.special_button_draw = function(){
		
			draw_sprite_stretched(spr_button_frame,0,(room_width/2)-70,173,140,24);
			if (instance_exists(obj_menu_cursor)) and (obj_menu_cursor.y == 173) draw_sprite_stretched(spr_button_frame,2,(room_width/2)-70,173,140,24);
			scribble("[fa_center][fa_top][fnt_game_gui_largest]End Game").draw((room_width/2)+1,173);
	}
			
	//controls
	//var _controls = instance_create_layer(_x-15,120,"Instances_2",obj_button);
	//_controls.my_text = "Controls";
	//_controls.image_yscale = .5;
	//_controls.activate_button = function(){	
	//	obj_game.pause_control_display = !obj_game.pause_control_display;
	//}
			
	//go to main menu
	//var _mm = instance_create_layer(_x-15,160,"Instances_2",obj_button);
	var _mm = instance_create_layer(_x-8,218,"Instances_2",obj_button);
	_mm.my_text = "Main Menu";
	_mm.image_yscale = .5;
	_mm.activate_button = function(){

		instance_activate_all();
		//have to check after you reactivate the music
		if (instance_exists(obj_music)){
			audio_stop_all();
			obj_music.level_music = -1;	
		}
		paused = false;
		pause_buttons_created = false;
		pause_control_display = false;
		room_goto(rm_main_menu);
		//scr_room_goto_transition(rm_main_menu);
	}
	
	_mm.special_draw = true;
	_mm.special_button_draw = function(){
		
			draw_sprite_stretched(spr_button_frame,0,(room_width/2)-70,218,140,24);
			if (instance_exists(obj_menu_cursor)) and (obj_menu_cursor.y == 218) draw_sprite_stretched(spr_button_frame,2,(room_width/2)-70,218,140,24);
			scribble("[fa_center][fa_top][fnt_game_gui_largest]Main Menu").draw((room_width/2)+1,218);
	}
			
	//quit game
	//var _quit = instance_create_layer(_x-15,200,"Instances_2",obj_button);
	//_quit.my_text = "Exit Game";
	//_quit.image_yscale = .5;
	//_quit.activate_button = function(){
	//	game_end();
	//}
}