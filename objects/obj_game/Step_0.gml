/// @description Insert description here
if (live_call()) return live_result;

if (room == rm_controls) exit;
if (room == rm_credits) exit;
if (room == rm_ending) exit;
if (room == rm_game_type_menu) exit;
if (room == rm_high_scores) exit;
if (room == rm_main_menu) exit;
if (room == rm_1P_level_00) exit;
if (room == rm_2P_level_00) exit;
if (room == rm_3P_level0) exit;
if (room == rm_4P_level0) exit;
if (room == rm_1P_level_00_CR) exit;
if (room == rm_2P_level_00_CR) exit;
if (room == rm_2P_level_00_RK) exit;


key_pause = gamepad_button_check_pressed(0, gp_start) || keyboard_check_pressed(vk_escape);

//prevent pause in attract room, causes issues when returning to main menu due to deactivation / reactivation
if (key_pause) and (room != rm_attract_mode){
	
	//become paused if you aren't
	if (paused == false){
		paused = true;	
	
		instance_deactivate_all(true);

		instance_activate_object(obj_camera);
		
		//turn off background
		var _til1, _til2;
		if (layer_exists("Tiles_1")){
			_til1 = layer_get_id("Tiles_1");	
			layer_set_visible(_til1,false);
		}
		//turn off background
		if (layer_exists("Tiles_2")){
			_til2 = layer_get_id("Tiles_2");	
			layer_set_visible(_til2,false);
		}
		
		exit;
	}
	//if you are paused, unpause
	if (paused == true){
		instance_activate_all();
		paused = false;
		pause_buttons_created = false;
		pause_control_display = false;
		if (instance_exists(obj_button)){
			instance_destroy(obj_button);
		};
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


}

//only decrease these while not paused or they will continue to decrease when paused
if (paused == false) and (!instance_exists(obj_room_transition_fade)) and (!instance_exists(obj_level_intro)){
	if (item_spawn_rate > 0){ item_spawn_rate --;}
	if (item_spawn_rate_sbvs_2 > 0){ item_spawn_rate_sbvs_2 --;}

	if (item_spawn_time > 0){ item_spawn_time --;}
}

#region Attract Room
if (room == rm_attract_mode){
	
	//bounce back to main menu if time is over or if any input received
	if (level_timer <= 0) or (keyboard_check_pressed(vk_anykey) or (scr_any_controller_button_input())){
		audio_stop_all();
		room_goto(rm_main_menu);	
	}
	
}
#endregion