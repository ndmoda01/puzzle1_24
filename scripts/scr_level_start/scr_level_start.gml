function scr_level_start(
	_level_timer = 150, 
	_item_spawn_time,
	_item_spawn_rate_max,
	_imposter_shoot_speed,
	_level_item_selection_pool_qty,
	_level_item_selection_pool,
	_level_item_percent_full,
	_vs = false){
	
	//level time remaning in frames. INT
	level_timer = _level_timer;
	//item spawn time (how long will items continue to spawn in the level) remaining in frames. INT
	item_spawn_time = _item_spawn_time;
	//spawning rate standard reset speed in frames (lower = faster spawning). INT
	item_spawn_rate_max = _item_spawn_rate_max;
	item_spawn_rate = item_spawn_rate_max;
	//spawn rate standard reset speed in frames for some 2 player modes
	item_spawn_rate_max_sbvs = _item_spawn_rate_max;
	item_spawn_rate_sbvs_2 = item_spawn_rate_max_sbvs;
	
	//speed imposters move once spawned (higher = faster movement). INT
	imposter_shoot_speed = _imposter_shoot_speed;
	//number of different types of items for this level. INT
	level_item_selection_pool_qty = _level_item_selection_pool_qty;
	//Items that can be picked from when spawning in this level. Array
	level_item_selection_pool = _level_item_selection_pool; 
	//how full the level is at the start of the level. Percent (ex .5)
	level_item_percent_full = _level_item_percent_full;
	//spawn starting items for 1 player and 2 player coop
	if (game_type == CLEANUP) instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn_blocks_color);
	else instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn);
	//spawn items for player 2 in vs modes
	if (_vs) {
		if (game_type == CLEANUP) instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn_blocks_color_sbvs_2p);
		else instance_create_layer(0,0,"Instances_1",obj_space_check_cursor_starting_item_spawn_sbvs_2p);
	}
	
	//level intro object
	instance_create_depth(0,0,-1000,obj_level_intro);
}