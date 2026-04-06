/// @description Insert description here
var _view_width = camera_get_view_width(view_camera[0]);
var _view_height = camera_get_view_height(view_camera[0]);
var _view_x = camera_get_view_x(view_camera[0]);
var _view_y = camera_get_view_y(view_camera[0]);

//classic type
if (obj_game.game_type == CLASSIC){
	//check to see if spawning time has run out (no more spawing items in this level)
	if (obj_game.item_spawn_time > 0){
	
		//if it's not over, see if it's time to spawn a new item
		if (obj_game.item_spawn_rate <= 0 and obj_game.level_timer > 0){
			
			var _free_space_check = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn);
			
			//update rate normally if not in split board mode
			if (obj_game.sbvs == false){
				obj_game.item_spawn_rate = obj_game.item_spawn_rate_max;
			}
			else{
				//otherwise check to see if you have any items queued first
				//if you don't have any items queued, spawn at normal rate
				if (player1_queued_items <= 0){
					obj_game.item_spawn_rate = obj_game.item_spawn_rate_max;
				}
				//if you do have items queued, spawn at a faster rate and reduce queued items
				else{
					obj_game.item_spawn_rate = obj_game.item_spawn_rate_reduced_rate_max;
					player1_queued_items--;
				}
			}
		
			//
			scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height);
		}	
	}
}

//endurance type
if (obj_game.game_type == ENDURANCE){
	//check to see if there are any remaming items
	if (obj_game.remaining_items > 0){
	
		//if it's not over, see if it's time to spawn a new item
		if (obj_game.item_spawn_rate <= 0){
		
			var _free_space_check = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn);
			
			//if you don't have any items queued, spawn at normal rate
			if (player1_queued_items <= 0){
				obj_game.item_spawn_rate = obj_game.item_spawn_rate_max;
			}
			//if you do have items queued, spawn at a faster rate and reduce queued items
			else{
				obj_game.item_spawn_rate = obj_game.item_spawn_rate_reduced_rate_max;
				player1_queued_items--;
			}
		
			scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height);
		}	
	}
}

//marathon type
if (obj_game.game_type == MARATHON){

	//see if it's time to spawn a new item
	if (obj_game.item_spawn_rate <= 0){
			
		var _free_space_check = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn);
			
		//update rate normally if not in split board mode
		if (obj_game.sbvs == false){
			obj_game.item_spawn_rate = obj_game.item_spawn_rate_max;
		}
		else{
			//otherwise check to see if you have any items queued first
			//if you don't have any items queued, spawn at normal rate
			if (player1_queued_items <= 0){
				obj_game.item_spawn_rate = obj_game.item_spawn_rate_max;
			}
			//if you do have items queued, spawn at a faster rate and reduce queued items
			else{
				obj_game.item_spawn_rate = obj_game.item_spawn_rate_reduced_rate_max;
				player1_queued_items--;
			}
		}
		
		scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height);
	}	
	
}

//Blockout type
if (obj_game.game_type == BLOCKOUT){
	
	//stop spawning if someone is knocked out
	if (obj_player1.knocked_out == true) or (obj_player2.knocked_out == true) exit;

	//see if it's time to spawn a new item
	if (obj_game.item_spawn_rate <= 0){
			
		var _free_space_check = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn);
			
		//update rate normally if not in split board mode
		if (obj_game.sbvs == false){
			obj_game.item_spawn_rate = obj_game.item_spawn_rate_max;
		}
		else{
			//otherwise check to see if you have any items queued first
			//if you don't have any items queued, spawn at normal rate
			if (player1_queued_items <= 0){
				obj_game.item_spawn_rate = obj_game.item_spawn_rate_max;
			}
			//if you do have items queued, spawn at a faster rate and reduce queued items
			else{
				obj_game.item_spawn_rate = obj_game.item_spawn_rate_reduced_rate_max;
				player1_queued_items--;
			}
		}
		
		scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height);
	}	
	
}
	
//Cleanup type
if (obj_game.game_type == CLEANUP){
	
	//stop spawning if someone is knocked out
	if (obj_player1.knocked_out == true) or (obj_player2.knocked_out == true) exit;

	//see if it's time to spawn a new item
	//both players will use the same timer in CLEANUP mode
	if (obj_game.item_spawn_rate <= 0){
		
		//check for full board with both players
		var _free_space_check_p1 = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn);
		var _free_space_check_p2 = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn_sbvs_2p);	
		
		//reset the spawn timer
		obj_game.item_spawn_rate = obj_game.item_spawn_rate_max;
		
		//set the direction
		scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height);
	}
}