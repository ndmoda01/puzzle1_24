function scr_marathon_level_increase(_item_spawn_rate_inc = 3,_item_shoot_speed_inc = 1,_rem_line_inc = 3){
	//incriment the level
	level++;
					
	//incriment the level color
	if (bg_color_index < 14){bg_color_index++;}
	else{bg_color_index = 0;}
	var _bg_fn_effect = layer_get_fx("Background");
	fx_set_parameter(_bg_fn_effect,"g_FractalNoiseTintColour",[bg_color[bg_color_index,0],bg_color[bg_color_index,1],bg_color[bg_color_index,2],bg_color[bg_color_index,3]]);
	fx_get_parameters(_bg_fn_effect);
					
	//inrease the speed of the item spawning and speed
	//spawning rate standard reset speed in frames (lower = faster spawning). INT
	item_spawn_rate_max -= _item_spawn_rate_inc;
	//set an absolute lowest frame wait time (aka fastest spawn speed)
	item_spawn_rate_max = max(20,item_spawn_rate_max);
					
	//speed imposters move once spawned (higher = faster movement). INT
	imposter_shoot_speed +=_item_shoot_speed_inc;
	//set an absolute highest speed for new items to move in
	imposter_shoot_speed = min(15,imposter_shoot_speed);
					
	//increase the maximum remaining lines and reset it
	remaining_lines_max += _rem_line_inc;
	remaining_lines = remaining_lines_max;

	//update music by restarting it
	//with(obj_music) event_perform(ev_other,ev_room_start);
}