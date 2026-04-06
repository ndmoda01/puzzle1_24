//need to check in the middle bc the target sprite collision box is small and in the middle
start_x = obj_space_check_start_sbvs_2p.x;
start_y = obj_space_check_start_sbvs_2p.y;
x = start_x;
y = start_y;

move_amount = 16;

free_space = [];

//run through each row to see if space is free, 
var _row_number = 1;
var _free_space_index = 0;

while(!place_meeting(x,y,obj_space_check_stop)){

	//check to see if you're at the end of the line
	if (place_meeting(x,y,obj_space_check_wall)){
		
		//return back to the start x, and ofset y
		x = start_x;
		y = start_y+(move_amount*_row_number);
		
		//increase row number
		_row_number++;
	}
	
	//check to see if something is there
	if (place_free(x,y)){
		//add your position to an array
		free_space[_free_space_index] = [x,y];
		_free_space_index++;
	}
	
	//move
	x += move_amount;
}

//check for round knock out if no free spaces found
if (_free_space_index == 0){
	if (obj_game.sbvs == true){
		//obj_game.game_over = true;
		obj_player2.knocked_out = true;
		audio_play_sound(snd_player_knockout,4,false);
		
		//destroy items currently on your side
		if (instance_exists(obj_fruit_parent)){
			with(obj_fruit_parent){
				if (my_player_board == 2) instance_destroy();	
			}
		}
		
		//prevent more items from spawning
		instance_destroy(obj_item_spawner_sbvs_2p);
		
		//destroy any items in the air
		if (instance_exists(obj_item_spawner_imposter)){
			with (obj_item_spawner_imposter){
				if (my_player_board ==2) instance_destroy();	
			}		
		}
		
		//destroy any targets on your side
		if (instance_exists(obj_target)){
			with (obj_target){
				if (my_player_board ==2) instance_destroy();	
			}	
		}	
		exit;
	}
}

//finish spot
//code will only run once bc it's in a create event
if (place_meeting(x,y,obj_space_check_stop)){

	//get a random space, then use it's variables to make a target. 
	//need to subtract 1 from free space index to account for the increase after the final entry above
	var _random_free_space_index = free_space[irandom_range(0,_free_space_index-1)];
	
	//spawn the target
	var _target_id = instance_create_layer(_random_free_space_index[0],_random_free_space_index[1],"Instances_2",obj_target);
	_target_id.my_player_board = 2;
	
	//spawn the item and set it's target
	var _new_item;
	if (instance_exists(obj_item_spawner_sbvs_2p)){
		_new_item = instance_create_layer(obj_item_spawner_sbvs_2p.x, obj_item_spawner_sbvs_2p.y,"Instances_2", obj_item_spawner_imposter);
	}
	if (instance_exists(obj_item_spawner_multi_same)){
		_new_item = instance_create_layer(obj_item_spawner_multi_same.x, obj_item_spawner_multi_same.y,"Instances_2", obj_item_spawner_imposter);
	}	
		//_new_item.sprite_index = spr_blueberry;
		_new_item.my_target_id = _target_id; 
		_new_item.my_player_board = 2;
		
		//calculate chances of a block being made 
		var _block_chance = 10*(obj_game.number_of_players);
		//var _block_chance = 50*(obj_game.number_of_players);
		var _random = irandom_range(1,100);
		
		//spawn a block if the score is under the block chance, and you're in endurance mode
		if(obj_game.game_type == ENDURANCE) and (_random < _block_chance){
			//_new_item.my_type = BLOCK;
			_new_item.my_type = ROCK;
		}
		//else if (obj_game.game_type == CLEANUP) 
		//spawn blocks if they have been sent to you and are queued
		else if (obj_game.game_type == BLOCKOUT) and (obj_item_spawner_sbvs_2p.player2_queued_items >0) _new_item.my_type = ROCK;
		//otherwise spawn normally
		//spawn a regular item
		else{
			switch(obj_game.level_item_selection_pool_qty){
				case 3:
					_new_item.my_type = choose(obj_game.level_item_selection_pool[0], obj_game.level_item_selection_pool[1], obj_game.level_item_selection_pool[2]);
				break;
				case 4:
					_new_item.my_type = choose(obj_game.level_item_selection_pool[0], obj_game.level_item_selection_pool[1], obj_game.level_item_selection_pool[2], obj_game.level_item_selection_pool[3]);

				break;
			
			}
		}
	
		_new_item.my_target_center_x = _target_id.x+8;
		_new_item.my_target_center_y = _target_id.y+8;
		audio_play_sound(snd_shoot_item,1,false);
		
	//destroy yourself
	instance_destroy();
}