//get inputs if player has control
if (has_control) and (!instance_exists(obj_level_intro)) and (knocked_out == false) and (obj_game.game_over == false){
	//get player input based on the player's number
	scr_player_input(player_number);
	
	//hold inputs update
	if (key_left) key_left_held++;
	else key_left_held = 0;
	if (key_right) key_right_held++;
	else key_right_held = 0;
	if (key_up) key_up_held++;
	else key_up_held = 0;
	if (key_down) key_down_held++;
	else key_down_held = 0;
}
//if player doesn't have control, set all to 0
else {
	key_left = 0;
	key_right = 0;
	key_up = 0;
	key_down = 0;
	key_select = 0;
	key_run = 0;
	key_left_held = 0;
	key_right_held = 0;
	key_up_held = 0;
	key_down_held = 0;
}



//calculate movement
//horizontal
var _horizontal = key_right - key_left;
h_move = (_horizontal * move_amount);

//vertical
var _vertical = key_down - key_up;
v_move = (_vertical * move_amount);

//decrease movement timer if buttons are being held
//if ((key_left_held or key_right_held or key_up_held or key_down_held) >= 20) and ((key_left_held or key_right_held or key_up_held or key_down_held) < 30) movement_timer = 10;
//if ((key_left_held or key_right_held or key_up_held or key_down_held) >= 30) and ((key_left_held or key_right_held or key_up_held or key_down_held) < 40) movement_timer = 8;
//if ((key_left_held or key_right_held or key_up_held or key_down_held) >= 40) and ((key_left_held or key_right_held or key_up_held or key_down_held) < 50) movement_timer = 6;
//if ((key_left_held or key_right_held or key_up_held or key_down_held) >= 50) and ((key_left_held or key_right_held or key_up_held or key_down_held) < 600)movement_timer = 4;

//if ((key_left_held < 6)) movement_timer = regular_movement_rate;
//if ((key_left_held) >= 6) and ((key_left_held) < 12) movement_timer = 10;
//if ((key_left_held) >= 12) and ((key_left_held) < 18) movement_timer = 8;
//if ((key_left_held) >= 18) and ((key_left_held) < 24) movement_timer = 6;
//if ((key_left_held) >= 24) and ((key_left_held) < 600) movement_timer = 4;

//increase speed (by decreasing the movement timer) if run button is held down
var _hold_min = 12;
if (key_run) or (key_left_held > _hold_min)or (key_right_held > _hold_min)or (key_down_held > _hold_min)or (key_up_held > _hold_min){
	movement_timer = fast_movement_rate;
}
else{
	movement_timer = regular_movement_rate;	
}

//set up a movement manager to limit the number of movements when a key is held down
//overlaping players possible version
if (movement_manager < 3){
	//check for collision, move if there won't be one
	//if (!place_meeting(x+h_move,y,obj_wall)) and (!place_meeting(x+h_move,y,obj_block)) and (!place_meeting(x+h_move,y,obj_block_color)){
	if (!place_meeting(x+h_move,y,obj_wall)) and (!place_meeting(x+h_move,y,obj_block)){
		x += h_move;
		if (x != xprevious){
			//incriment this only after moving
			movement_manager+=movement_timer;
		}
	}
	//if (!place_meeting(x,y+v_move,obj_wall)) and (!place_meeting(x,y+v_move,obj_block)) and (!place_meeting(x,y+v_move,obj_block_color)){
	if (!place_meeting(x,y+v_move,obj_wall)) and (!place_meeting(x,y+v_move,obj_block)) {
		
		y += v_move;
		if (y != yprevious){
			movement_manager+=movement_timer;
		}
	}
}

//reduce the movement delay
movement_manager--;
movement_manager = max(0, movement_manager);

//pick up an object if you're not holding something
if ((key_select) and holding == false){
	
	if (place_meeting(x,y,obj_fruit_parent)){
		holding = true;
		audio_play_sound(snd_pick_up,5,false);
		instance_holding_id = instance_place(x,y,obj_fruit_parent);
	
		//grab sprite of what you're holding			
		instance_holding_sprite_index = instance_holding_id.sprite_index;
		instance_holding_image_index = instance_holding_id.image_index;
			
		//pass over variables to the held object
		instance_holding_id.held_by = id;
		instance_holding_id.currently_held = true;
			
		//deactivaate what you're holding
		//deactivation causing issues when unpausing
		//instance_deactivate_object(instance_holding_id);
		//move the object off of the screen temporarily
		instance_holding_id.x = -100;
	}
	//don't want to go on to the next line and reset everything in the first frame the item becomes held
	exit;
}


//putting down a currently held object
if ((key_select) and holding == true){
		
	//can't put down item sound
	//need to check before a held item is dropped or it will trigger frequently
	if(place_meeting(x,y,obj_target)){
			audio_play_sound(snd_cant_put_down,4,false);
	}
	
	//swap if over top another item and press the button
	//nomral item dropping and swap
	if (!place_meeting(x,y,obj_target)){
			
		//pick up the new object that you will swap with
		if (place_meeting(x,y,obj_fruit_parent)){

			audio_play_sound(snd_pick_up,5,false);
			//save the instance you're picking up to a temp var
			instance_holding_id_temp = instance_place(x,y,obj_fruit_parent);
			
		}
		//nothing was there, so you could put it down
		else{
			
			holding = false;
		}
			
		audio_play_sound(snd_put_down,5,false);
		
		//reactivate item and update position
		//instance_activate_object(instance_holding_id);
		instance_holding_id.x = x;
		instance_holding_id.y = y;
		
		//reset
		instance_holding_sprite_index = noone;
		instance_holding_image_index = noone;
		instance_holding_id.held_by = noone;
		instance_holding_id.currently_held = false;
		
		//check for line of objects in each direction (horizontal left and right, vertical up and down, forward slash down and up, and back slash down and up)
		//horizontal check
		#region //*** check horizontal right ***
		var hr = 0;
		while (place_meeting(x+((hr+1)*move_amount),y,obj_fruit_parent)) {
			var _inst = instance_place(x+((hr+1)*move_amount),y,obj_fruit_parent);
			
			//or (_inst.my_type == WILD)
			//or (instance_holding_id.my_type == WILD)
			//if the type is the same, add id to the list
			if (_inst.my_type == instance_holding_id.my_type) or (_inst.my_type == WILD) or (_inst.my_type == BLOCK) or ((_inst.my_type == BLOCK_COLOR) and (_inst.my_color == instance_holding_id.my_color)){
				collection_grid[# hr,HORIZONTAL] = _inst;
				hr++;
			}
			//if its not the same, jump out
			else{ break;}
		}
		
		//check the last instance in the array to see if it's a block
		//need to minus one off of hr since its being added after adding an instance and breaking out of that loop the next time through
		for (var i=hr-1; i > -1; i--){
		
			//start at the hight of the grid and move down
			//pull out the inst at the current position and see if it's a block
			//if it's a block, clear it and continue until you hit something that's not a block or reach the end of the array
			var _check_inst = collection_grid[# i, HORIZONTAL];
			//if it's not empty, do the additional checks
			if (_check_inst.my_type == BLOCK) or (_check_inst.my_type == BLOCK_COLOR){
				collection_grid[# i, HORIZONTAL] = 0;
				//need to adjust hr so that array location will be correct for hl 
				hr--;
			}
			else if (_check_inst.my_type != BLOCK){break;} 
		
		}
		#endregion
				
		#region //*** check horizontal left ***
		var hl = 0;
		while (place_meeting(x-((hl+1)*move_amount),y,obj_fruit_parent)) {
			var _inst = instance_place(x-((hl+1)*move_amount),y,obj_fruit_parent);
					
			//if the type is the same, add id to the list
			if (_inst.my_type == instance_holding_id.my_type) or (_inst.my_type == WILD) or (_inst.my_type == BLOCK) or ((_inst.my_type == BLOCK_COLOR) and (_inst.my_color == instance_holding_id.my_color)){
				collection_grid[# hr+hl,HORIZONTAL] = _inst;
				hl++;
			}
			//if its not the same, jump out
			else{ break;}
		}
		
		//check the last instance in the array to see if it's a block
		//need to minus one off of hr since its being added after adding an instance and breaking out of that loop the next time through
		for (var i=hr+hl-1; i > -1; i--){
		
			//start at the hight of the grid and move down
			//pull out the inst at the current position and see if it's a block
			//if it's a block, clear it and continue until you hit something that's not a block or reach the end of the array
			var _check_inst = collection_grid[# i, HORIZONTAL];
			//if it's not empty, do the additional checks
			if (_check_inst.my_type == BLOCK) or (_check_inst.my_type == BLOCK_COLOR){
				collection_grid[# i, HORIZONTAL] = 0;
				//need to adjust hr so that array location will be correct for hl 
				hl--;
			}
			else if (_check_inst.my_type != BLOCK){break;} 
		
		}
		#endregion
		
		#region //*** check vertical down ***
		var vd = 0;
		while (place_meeting(x,y+((vd+1)*move_amount),obj_fruit_parent)) {
			var _inst = instance_place(x,y+((vd+1)*move_amount),obj_fruit_parent);
				
			//if the type is the same, add id to the list
			if (_inst.my_type == instance_holding_id.my_type) or (_inst.my_type == WILD) or (_inst.my_type == BLOCK) or ((_inst.my_type == BLOCK_COLOR) and (_inst.my_color == instance_holding_id.my_color)){
				collection_grid[# vd,VERTICAL] = _inst;
				vd++;
			}
			//if its not the same, jump out
			else{ break;}
		}
		
		//check the last instance in the array to see if it's a block
		//need to minus one off of hr since its being added after adding an instance and breaking out of that loop the next time through
		for (var i=vd-1; i > -1; i--){
		
			//start at the hight of the grid and move down
			//pull out the inst at the current position and see if it's a block
			//if it's a block, clear it and continue until you hit something that's not a block or reach the end of the array
			var _check_inst = collection_grid[# i, VERTICAL];
			//if it's not empty, do the additional checks
			if (_check_inst.my_type == BLOCK) or (_check_inst.my_type == BLOCK_COLOR){
				collection_grid[# i, VERTICAL] = 0;
				//need to adjust hr so that array location will be correct for hl 
				vd--;
			}
			else if (_check_inst.my_type != BLOCK){break;} 
		
		}
		#endregion
			
		#region //*** check vertical up ***
		var vu = 0;
		while (place_meeting(x,y-((vu+1)*move_amount),obj_fruit_parent)) {
			var _inst = instance_place(x,y-((vu+1)*move_amount),obj_fruit_parent);
				
			//if the type is the same, add id to the list
			if (_inst.my_type == instance_holding_id.my_type) or (_inst.my_type == WILD) or (_inst.my_type == BLOCK) or ((_inst.my_type == BLOCK_COLOR) and (_inst.my_color == instance_holding_id.my_color)){
				collection_grid[# vd+vu,VERTICAL] = _inst;
				vu++;
			}
			//if its not the same, jump out
			else{ break;}

		}
		
		//check the last instance in the array to see if it's a block
		//need to minus one off of hr since its being added after adding an instance and breaking out of that loop the next time through
		for (var i=vd+vu-1; i > -1; i--){
		
			//start at the hight of the grid and move down
			//pull out the inst at the current position and see if it's a block
			//if it's a block, clear it and continue until you hit something that's not a block or reach the end of the array
			var _check_inst = collection_grid[# i, VERTICAL];
			//if it's not empty, do the additional checks
			if (_check_inst.my_type == BLOCK) or (_check_inst.my_type == BLOCK_COLOR){
				collection_grid[# i, VERTICAL] = 0;
				//need to adjust hr so that array location will be correct for hl 
				hl--;
			}
			else if (_check_inst.my_type != BLOCK){break;} 
		
		}
		#endregion
		
		#region //*** check diagonal forward slash down ***
		var dfsd = 0;
		while (place_meeting(x-((dfsd+1)*move_amount),y+((dfsd+1)*move_amount),obj_fruit_parent)) {
			var _inst = instance_place(x-((dfsd+1)*move_amount),y+((dfsd+1)*move_amount),obj_fruit_parent);
				
			//if the type is the same, add id to the list
			if (_inst.my_type == instance_holding_id.my_type) or (_inst.my_type == WILD) or (_inst.my_type == BLOCK) or ((_inst.my_type == BLOCK_COLOR) and (_inst.my_color == instance_holding_id.my_color)){
				collection_grid[# dfsd,DIAGONAL_FS] = _inst;
				dfsd++;
			}
			//if its not the same, jump out
			else{ break;}
		}
		
		//check the last instance in the array to see if it's a block
		//need to minus one off of hr since its being added after adding an instance and breaking out of that loop the next time through
		for (var i=dfsd-1; i > -1; i--){
		
			//start at the hight of the grid and move down
			//pull out the inst at the current position and see if it's a block
			//if it's a block, clear it and continue until you hit something that's not a block or reach the end of the array
			var _check_inst = collection_grid[# i, DIAGONAL_FS];
			//if it's not empty, do the additional checks
			if (_check_inst.my_type == BLOCK)  or (_check_inst.my_type == BLOCK_COLOR){
				collection_grid[# i, DIAGONAL_FS] = 0;
				//need to adjust hr so that array location will be correct for hl 
				dfsd--;
			}
			else if (_check_inst.my_type != BLOCK){break;} 
		
		}
		#endregion
			
		#region //*** check diagonal forward slash up ***
		var dfsu = 0;
		while (place_meeting(x+((dfsu+1)*move_amount),y-((dfsu+1)*move_amount),obj_fruit_parent)) {
			var _inst = instance_place(x+((dfsu+1)*move_amount),y-((dfsu+1)*move_amount),obj_fruit_parent);
				
			//if the type is the same, add id to the list
			if (_inst.my_type == instance_holding_id.my_type) or (_inst.my_type == WILD) or (_inst.my_type == BLOCK) or ((_inst.my_type == BLOCK_COLOR) and (_inst.my_color == instance_holding_id.my_color)){
				collection_grid[# dfsd+dfsu,DIAGONAL_FS] = _inst;
				dfsu++;
			}
			//if its not the same, jump out
			else{ break;}
		}
		
		//check the last instance in the array to see if it's a block
		//need to minus one off of hr since its being added after adding an instance and breaking out of that loop the next time through
		for (var i=dfsd+dfsu-1; i > -1; i--){
		
			//start at the hight of the grid and move down
			//pull out the inst at the current position and see if it's a block
			//if it's a block, clear it and continue until you hit something that's not a block or reach the end of the array
			var _check_inst = collection_grid[# i, DIAGONAL_FS];
			//if it's not empty, do the additional checks
			if (_check_inst.my_type == BLOCK) or (_check_inst.my_type == BLOCK_COLOR){
				collection_grid[# i, DIAGONAL_FS] = 0;
				//need to adjust hr so that array location will be correct for hl 
				dfsu--;
			}
			else if (_check_inst.my_type != BLOCK){break;} 
		
		}
		#endregion
		
		#region //*** check diagonal backslash down ***
		var dbsd = 0;
		while (place_meeting(x+((dbsd+1)*move_amount),y+((dbsd+1)*move_amount),obj_fruit_parent)) {
			var _inst = instance_place(x+((dbsd+1)*move_amount),y+((dbsd+1)*move_amount),obj_fruit_parent);
				
			//if the type is the same, add id to the list
			if (_inst.my_type == instance_holding_id.my_type) or (_inst.my_type == WILD) or (_inst.my_type == BLOCK) or ((_inst.my_type == BLOCK_COLOR) and (_inst.my_color == instance_holding_id.my_color)){
				collection_grid[# dbsd,DIAGONAL_BS] = _inst;
				dbsd++;
			}
			//if its not the same, jump out
			else{ break;}
		}
		
		//check the last instance in the array to see if it's a block
		//need to minus one off of hr since its being added after adding an instance and breaking out of that loop the next time through
		for (var i=dbsd-1; i > -1; i--){
		
			//start at the hight of the grid and move down
			//pull out the inst at the current position and see if it's a block
			//if it's a block, clear it and continue until you hit something that's not a block or reach the end of the array
			var _check_inst = collection_grid[# i, DIAGONAL_BS];
			//if it's not empty, do the additional checks
			if (_check_inst.my_type == BLOCK) or (_check_inst.my_type == BLOCK_COLOR){
				collection_grid[# i, DIAGONAL_BS] = 0;
				//need to adjust hr so that array location will be correct for hl 
				dbsd--;
			}
			else if (_check_inst.my_type != BLOCK){break;} 
		
		}
		#endregion

		#region //*** check diagonal backslash up ***
		var dbsu = 0;
		while (place_meeting(x-((dbsu+1)*move_amount),y-((dbsu+1)*move_amount),obj_fruit_parent)) {
			var _inst = instance_place(x-((dbsu+1)*move_amount),y-((dbsu+1)*move_amount),obj_fruit_parent);
				
			//if the type is the same, add id to the list
			if (_inst.my_type == instance_holding_id.my_type) or (_inst.my_type == WILD) or (_inst.my_type == BLOCK) or ((_inst.my_type == BLOCK_COLOR) and (_inst.my_color == instance_holding_id.my_color)){
				collection_grid[# dbsd+dbsu,DIAGONAL_BS] = _inst;
				dbsu++;
			}
			//if its not the same, jump out
			else{ break;}
		}
		
		
		//check the last instance in the array to see if it's a block
		//need to minus one off of hr since its being added after adding an instance and breaking out of that loop the next time through
		for (var i=dbsd+dbsu-1; i > -1; i--){
		
			//start at the hight of the grid and move down
			//pull out the inst at the current position and see if it's a block
			//if it's a block, clear it and continue until you hit something that's not a block or reach the end of the array
			var _check_inst = collection_grid[# i, DIAGONAL_BS];
			//if it's not empty, do the additional checks
			if (_check_inst.my_type == BLOCK) or (_check_inst.my_type == BLOCK_COLOR){
				collection_grid[# i, DIAGONAL_BS] = 0;
				//need to adjust hr so that array location will be correct for hl 
				dbsu--;
			}
			else if (_check_inst.my_type != BLOCK){break;} 
		
		}
		#endregion
		
		var _player_multi = 1;
		//get player's multiplyer before increasing it in the blow scripts
		switch(player_number){
			case 1:
				_player_multi = obj_game.player1_score_modifier;
			break;
			case 2:
				_player_multi = obj_game.player2_score_modifier;
			break;
			case 3:
				_player_multi = obj_game.player3_score_modifier;
			break;
			case 4:
				_player_multi = obj_game.player4_score_modifier;
			break;

		}
		
		//line bonus multiplier (bonus for a 2nd, 3rd, or 4th line) needs to be determined here so that info can be passed into the collection_qty_function
		//All line direction lengths would need to be known, so they could be compared to see the largest one
		//A line bonus must be higher on longer lines 
		
		//check for collections in all 4 directions
		//returns the score that will be assigned to each instance in that specific row being scored (excluding the instance held by player)
		var _hoz_score = scr_collection_qty_check(HORIZONTAL, horizontal_collection_id, horizontal_collection_qty,_player_multi);
		var _ver_score = scr_collection_qty_check(VERTICAL, vertical_collection_id, vertical_collection_qty, _player_multi);
		var _diag_fs_score = scr_collection_qty_check(DIAGONAL_FS, diagonal_fs_collection_id, diagonal_fs_collection_qty,_player_multi);
		var _diag_bs_score = scr_collection_qty_check(DIAGONAL_BS, diagonal_bs_collection_id, diagonal_bs_collection_qty, _player_multi);
		
		//get the highest return value from the collection check script and save it
		highest_score_collection_instance = max(_hoz_score,_ver_score,_diag_fs_score, _diag_bs_score);
		
		//determine the longest collection line of the lines that are being scored 
		//1 line, regular score. 2 lines (smaller line reg., larger x2), 3 lines (smallest reg, med x2, large x3), 4 lines (small reg, med x2, large x3, longest x4)
		var _collection_qty_rank = [];
		//put scores into the array
		_collection_qty_rank[0] = _hoz_score;
		_collection_qty_rank[1] = _ver_score;
		_collection_qty_rank[2] = _diag_fs_score;
		_collection_qty_rank[3] = _diag_bs_score;
		//sort the array into ascending order (smallest to largest)
		array_sort(_collection_qty_rank,true);
		//multiply line bonus from smallest value to largest value line collection
		_collection_qty_rank[0] = _collection_qty_rank[0]*1;
		_collection_qty_rank[1] = _collection_qty_rank[1]*2;
		_collection_qty_rank[2] = _collection_qty_rank[2]*3;
		_collection_qty_rank[3] = _collection_qty_rank[3]*4;
		
		
		//if there is a collection, destroy the held instance
		//destroy the one you're holding and reset
		if (instance_holding_id != noone)and (number_of_collections > 0){
			//score it
			var _inst_score_card = instance_create_layer(instance_holding_id.x,instance_holding_id.y,"Instances_1",obj_score_card);
			//increase score of this instance by the number of collection lines (doesn't work bc might run during first collection, not after 2 or 3 collections
			//var _multi_bonus = highest_score_collection_instance*number_of_collections;
				
			
			//score the bonus for center instance old (top line, new below)
			switch(player_number){
				case 1: 
					//var _multi_bonus = highest_score_collection_instance*number_of_collections*_player_multi;
					var _multi_bonus = (_hoz_score+_ver_score+_diag_bs_score+_diag_fs_score)*_player_multi;
					obj_game.player1_score += _multi_bonus;
					var _inst_color_card = instance_create_layer(instance_holding_id.x,instance_holding_id.y,"Player_backgrounds",obj_player1_background);
				break;
				case 2: 
					//var _multi_bonus = highest_score_collection_instance*number_of_collections*_player_multi;	
					var _multi_bonus = (_hoz_score+_ver_score+_diag_bs_score+_diag_fs_score)*_player_multi;
					obj_game.player2_score += _multi_bonus;
					var _inst_color_card = instance_create_layer(instance_holding_id.x,instance_holding_id.y,"Player_backgrounds",obj_player2_background);
				break;
				case 3: 
					//var _multi_bonus = highest_score_collection_instance*number_of_collections*_player_multi;
					var _multi_bonus = (_hoz_score+_ver_score+_diag_bs_score+_diag_fs_score)*_player_multi;
					obj_game.player3_score += _multi_bonus;
				break;
				case 4: 
					//var _multi_bonus = highest_score_collection_instance*number_of_collections*_player_multi;
					var _multi_bonus = (_hoz_score+_ver_score+_diag_bs_score+_diag_fs_score)*_player_multi;
					obj_game.player4_score += _multi_bonus;
				break;
			}
				
			//update score card's score to be correct
			_inst_score_card.my_score = _multi_bonus;
				
			//update the held instance's collection qty variable		
			//instance_holding_id.my_collection_qty = max(horizontal_collection_qty,vertical_collection_qty,diagonal_fs_collection_qty, diagonal_bs_collection_qty);
			//destroy it and reset
			instance_destroy(instance_holding_id);
			obj_game.remaining_items--;
			audio_play_sound(snd_collect_line,5,false);
			instance_holding_id = noone;
			
		}
			
		//reset variables
		horizontal_collection_qty = 1;
		vertical_collection_qty = 1;
		diagonal_fs_collection_qty = 1;
		diagonal_bs_collection_qty = 1;
		number_of_collections = 0;
		
		instance_holding_id = noone;
		ds_grid_clear(collection_grid,0);
			
		//swap in temp fruit to be the current one held
		if (instance_holding_id_temp != noone){
			instance_holding_id = instance_holding_id_temp;
			instance_holding_image_index = instance_holding_id_temp.image_index;
			instance_holding_id_temp = noone;
					
			//run regular pickup code
			//grab sprite of what you're holding			
			instance_holding_sprite_index = instance_holding_id.sprite_index;
			
			//pass over variables to the held object
			instance_holding_id.held_by = id;
			instance_holding_id.currently_held = true;
			
			//deactivaate what you're holding
			//instance_deactivate_object(instance_holding_id);
			//move off screen temporarily
			instance_holding_id.x = -100;
		}
	}
}
