//this runs when this room starts for the first time and restarts every time
function scr_endurance_room_start(){
	
	//since this room is constantly restarting, these variables will need to be defined when level 1 is initially starting only (after practice room), then modified end of each level
		
	//get the layer and then set the tint color
	var _bg_fn_effect = layer_get_fx("Background");
	fx_set_parameter(_bg_fn_effect,"g_FractalNoiseTintColour",[bg_color[bg_color_index,0],bg_color[bg_color_index,1],bg_color[bg_color_index,2],bg_color[bg_color_index,3]]);
	fx_get_parameters(_bg_fn_effect);
	//var _param_names = fx_get_parameter_names(_bg_fn_effect);
	//for (var i = 0; i < array_length(_param_names); i ++) {
	//    show_debug_message("Parameter " + string(i) + ": " + _param_names[i]);
	//} 
	
	
	level_item_selection_pool_qty = 4;
	//make the pool randomly, as many as 4 types
	var _fourth_fruit  = choose(4,5);
	var _third_fruit   = choose (3,4);
	var _second_fruit  = choose (2,3);
	var _first_fruit   = choose (1,2);
	
	//if there happend to be only 2 types, change one of them so there are at least 3 types
	if (_fourth_fruit == 4) and (_third_fruit == 4) and (_second_fruit == 2) and (_first_fruit == 2){
		var _rand = irandom(3);
		switch(_rand){
			case 0: _fourth_fruit  = 5;break;
			case 1: _third_fruit   = 3;break;
			case 2: _second_fruit  = 3;break;
			case 3: _first_fruit   = 1;break;
		}
	}
	
	level_item_selection_pool = [_first_fruit,_second_fruit,_third_fruit,_fourth_fruit];
		
	number_of_spawning_blocks = level*(instance_number(obj_player_parent))*2;
	instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn_blocks);
	
	if (obj_game.sbvs == true) and (obj_game.multiplayer_mode == MULTI_COMP){
		instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn_blocks_sbvs_2P);
	}
	
	//level intro object
	instance_create_depth(0,0,-1000,obj_level_intro);

}