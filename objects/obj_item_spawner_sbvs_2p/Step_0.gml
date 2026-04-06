/// @description Insert description here
var _view_width = camera_get_view_width(view_camera[0]);
var _view_height = camera_get_view_height(view_camera[0]);
var _view_x = camera_get_view_x(view_camera[0]);
var _view_y = camera_get_view_y(view_camera[0]);

//prevent starting too early
if (instance_exists(obj_level_intro) or instance_exists(obj_room_transition) or instance_exists(obj_room_transition_fade)) exit;

//classic type
if (obj_game.game_type == CLASSIC){
	//check to see if spawning time has run out (no more spawing items in this level)
	if (obj_game.item_spawn_time > 0){
	
		//if it's not over, see if it's time to spawn a new item
		if (obj_game.item_spawn_rate_sbvs_2 <= 0 and obj_game.level_timer > 0){
		
			var _free_space_check = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn_sbvs_2p);
		
			//if you don't have any items queued, spawn at normal rate
			if (player2_queued_items <= 0){
				obj_game.item_spawn_rate_sbvs_2 = obj_game.item_spawn_rate_max;
			}
			//if you do have items queued, spawn at a faster rate and reduce queued items
			else{
				obj_game.item_spawn_rate_sbvs_2 = obj_game.item_spawn_rate_reduced_rate_max;
				player2_queued_items--;
			}
		
			scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height);

		}	
	}
}

//endurance type
if (obj_game.game_type == ENDURANCE){
	//check to see if there are any remaming items
	if (obj_game.remaining_items > 0){
	
		//if it's not over, see if it's time to spawn a new item
		if (obj_game.item_spawn_rate_sbvs_2 <= 0){
		
			var _free_space_check = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn_sbvs_2p);
			
			//if you don't have any items queued, spawn at normal rate
			if (player2_queued_items <= 0){
				obj_game.item_spawn_rate_sbvs_2 = obj_game.item_spawn_rate_max;
			}
			//if you do have items queued, spawn at a faster rate and reduce queued items
			else{
				obj_game.item_spawn_rate_sbvs_2 = obj_game.item_spawn_rate_reduced_rate_max;
				player2_queued_items--;
			}
		
			
			scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height);
			
		}	
	}
}
	
//marathon type
if (obj_game.game_type == MARATHON){

	//see if it's time to spawn a new item
	if (obj_game.item_spawn_rate_sbvs_2 <= 0){
			
		var _free_space_check = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn_sbvs_2p);
			

		//otherwise check to see if you have any items queued first
		//if you don't have any items queued, spawn at normal rate
		if (player2_queued_items <= 0){
			obj_game.item_spawn_rate_sbvs_2 = obj_game.item_spawn_rate_max;
		}
		//if you do have items queued, spawn at a faster rate and reduce queued items
		else{
			obj_game.item_spawn_rate_sbvs_2 = obj_game.item_spawn_rate_reduced_rate_max;
			player2_queued_items--;
		}
	
		
		scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height);
	}	
	
}

//Blockout type
if (obj_game.game_type == BLOCKOUT){
	
	//increase the number of items needed to spawn before speed increase once the speed is getting fast (preventing an exponential speed ramp at the end)
	if (obj_game.item_spawn_rate_max_sbvs < 20) player2_speed_increase_items_max = player2_speed_increase_items_max_high_speed; //this  variable will be set every frame, but  should be fine to do that
	
	//stop spawning if someone is knocked out
	if (obj_player1.knocked_out == true) or (obj_player2.knocked_out == true) exit;

	//see if it's time to spawn a new item
	if (obj_game.item_spawn_rate_sbvs_2 <= 0){
		
		
		//decrease the items remaining before the next speed increase
		player2_speed_increase_items_remaining--;
		if (player2_speed_increase_items_remaining <= 0){
			//reduce the max spawn frames, so that it will automatically refresh to the new lower rate
			if (obj_game.item_spawn_rate_max_sbvs > obj_game.item_spawn_rate_max_blockout){
				obj_game.item_spawn_rate_max_sbvs -= player2_speed_increase_amount;	
				//increase the current level speed
				player2_speed_level++;
			}
			
			//reset the remaining items variable 
			player2_speed_increase_items_remaining = player2_speed_increase_items_max;
		}
			
		var _free_space_check = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn_sbvs_2p);
			

		//otherwise check to see if you have any items queued first
		//if you don't have any items queued, spawn at normal max rate
		if (player2_queued_items <= 0){
			obj_game.item_spawn_rate_sbvs_2 = obj_game.item_spawn_rate_max_sbvs;
		}
		//if you do have items queued, spawn at a faster rate and reduce queued items
		else{
			obj_game.item_spawn_rate_sbvs_2 = obj_game.item_spawn_rate_reduced_rate_max;
			player2_queued_items--;
		}
	
		
		scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height);
	}	
	
}
	
//Cleanup type
if (obj_game.game_type == CLEANUP){
	
	//if there are still blocks remaining to be cleaned up, proceed with spawning
	if (obj_game.remaining_color_blocks_P2 > 0){
		
		
		//stop spawning if someone is knocked out
		//if (obj_player1.knocked_out == true) or (obj_player2.knocked_out == true) exit;
		if (obj_player2.knocked_out == true) exit;

		//see if it's time to spawn a new item
		if (obj_game.item_spawn_rate_sbvs_2 <= 0){
			
			var _free_space_check = instance_create_layer(x, y,"Instances_1", obj_space_check_cursor_item_spawn_sbvs_2p);
			

			//otherwise check to see if you have any items queued first
			//if you don't have any items queued, spawn at normal rate
			if (player2_queued_items <= 0){
				obj_game.item_spawn_rate_sbvs_2 = obj_game.item_spawn_rate_max;
			}
			//if you do have items queued, spawn at a faster rate and reduce queued items
			else{
				obj_game.item_spawn_rate_sbvs_2 = obj_game.item_spawn_rate_reduced_rate_max;
				player2_queued_items--;
			}
	
		
			scr_set_shoot_direction(_view_x,_view_y,_view_width,_view_height);
		}	
	}
}