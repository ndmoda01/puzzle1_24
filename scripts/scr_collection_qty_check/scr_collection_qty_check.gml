///@ARG DIRECTION_ENUM
///@ARG DIRECTION_ID_ARRAY
///@ARG DIRECTION_COUNTER
///@ARG PLAYER_MULTIPLIER
///script run by the player objects

function scr_collection_qty_check(argument0,argument1,argument2, argument3){

	var _dir_enum = argument0;
	var _dir_id_array = argument1;
	var _dir_counter = argument2;
	var _player_multiplier = argument3;
	//set multiplier to 1 to effectively remove it's impact
	_player_multiplier = 1;
	
	//check the ds_grid to see how many instnaces are in it
	for (var i = 0; i < ds_grid_width(collection_grid); i++){
			
		//if the entry isn't 0, 
		if (collection_grid[# i, _dir_enum] != 0){
				//save that entry into the direction collection array
				_dir_id_array[_dir_counter] = collection_grid[# i, _dir_enum];
				//increase qty of instances in the collection array
				_dir_counter++;
		}
	}
	
	var _inst_points = 0;
	var _item_collection_max = 10	
	//if the quantity is higher than level min, score the items
	if (_dir_counter >= level_collection_min){
		
		number_of_collections ++;
		
		//if qty is more than the max, they score the max points
		var _qty_inst_score = _dir_counter;
		//Limit the max score amount in one collection to a max value
		//if (_qty_inst_score > _item_collection_max) _qty_inst_score = _item_collection_max;
		
		//score the items
		#region Instance Scoring Method 1
		/*
		switch(_qty_inst_score){
			case 3: 
					//apply the score to the correct player
					//the last item (one you are holding) will be scored separately if there is a bonus, so scores are multiplied by 1 less than in the collection
					switch(player_number){
						case 1: obj_game.player1_score += ((obj_game.score_three*2)*_player_multiplier);
						break;
						case 2: obj_game.player2_score += ((obj_game.score_three*2)*_player_multiplier);
						break;
						case 3: obj_game.player3_score += ((obj_game.score_three*2)*_player_multiplier);
						break;
						case 4: obj_game.player4_score += ((obj_game.score_three*2)*_player_multiplier);
						break;
					}
					//save how much each instance should display on their score card
					_inst_points = obj_game.score_three;
			break;
			case 4: 
					switch(player_number){
						case 1: obj_game.player1_score += ((obj_game.score_four*3)*_player_multiplier);
								//scr_increase_multiplyer(1,1);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(1,1);
						break;
						case 2: obj_game.player2_score += ((obj_game.score_four*3)*_player_multiplier);
								//scr_increase_multiplyer(2,1);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(2,1);
						break;
						case 3: obj_game.player3_score += ((obj_game.score_four*3)*_player_multiplier);
								//scr_increase_multiplyer(3,1);
						break;
						case 4: obj_game.player4_score += ((obj_game.score_four*3)*_player_multiplier);
								//scr_increase_multiplyer(4,1);
						break;
					}
					_inst_points = obj_game.score_four;
			break;
			case 5: 
					switch(player_number){
						case 1: obj_game.player1_score += ((obj_game.score_five*4)*_player_multiplier);
								//scr_increase_multiplyer(1,2);
								//scr_decrease_multiplyer(1,1);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(1,2);
						break;
						case 2: obj_game.player2_score += ((obj_game.score_five*4)*_player_multiplier);
								//scr_increase_multiplyer(2,2);
								//scr_decrease_multiplyer(2,1);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(2,2);
						break;
						case 3: obj_game.player3_score += ((obj_game.score_five*4)*_player_multiplier);
								//scr_increase_multiplyer(3,2);
								//scr_decrease_multiplyer(3,1);
						break;
						case 4: obj_game.player4_score += ((obj_game.score_five*4)*_player_multiplier);
								//scr_increase_multiplyer(4,2);
								//scr_decrease_multiplyer(4,1);
						break;
					}
					_inst_points = obj_game.score_five;
			break;
			case 6: 
					switch(player_number){
						case 1: obj_game.player1_score += ((obj_game.score_six*5)*_player_multiplier);
								//scr_increase_multiplyer(1,3);
								//scr_decrease_multiplyer(1,2);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(1,3);
						break;
						case 2: obj_game.player2_score += ((obj_game.score_six*5)*_player_multiplier);
								//scr_increase_multiplyer(2,3);
								//scr_decrease_multiplyer(2,2);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(2,3);
						break;
						case 3: obj_game.player3_score += ((obj_game.score_six*5)*_player_multiplier);
								//scr_increase_multiplyer(3,3);
								//scr_decrease_multiplyer(3,2);
						break;
						case 4: obj_game.player4_score += ((obj_game.score_six*5)*_player_multiplier);
								//scr_increase_multiplyer(4,3);
								//scr_decrease_multiplyer(4,2);
						break;
					}
					_inst_points = obj_game.score_six;
			break;
			case 7: 
					switch(player_number){
						case 1: obj_game.player1_score += ((obj_game.score_seven*6)*_player_multiplier);
								//scr_increase_multiplyer(1,4);
								//scr_decrease_multiplyer(1,3);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(1,4);
						break;
						case 2: obj_game.player2_score += ((obj_game.score_seven*6)*_player_multiplier);
								//scr_increase_multiplyer(2,4);
								//scr_decrease_multiplyer(2,3);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(2,4);
						break;
						case 3: obj_game.player3_score += ((obj_game.score_seven*6)*_player_multiplier);
								//scr_increase_multiplyer(3,4);
								//scr_decrease_multiplyer(3,3);
						break;
						case 4: obj_game.player4_score += ((obj_game.score_seven*6)*_player_multiplier);
								//scr_increase_multiplyer(4,4);
								//scr_decrease_multiplyer(4,3);
						break;
					}
					_inst_points = obj_game.score_seven;
			break;
			case 8: 
					switch(player_number){
						case 1: obj_game.player1_score += ((obj_game.score_eight*7)*_player_multiplier);
								//scr_increase_multiplyer(1,5);
								//scr_decrease_multiplyer(1,4);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(1,5);
						break;
						case 2: obj_game.player2_score += ((obj_game.score_eight*7)*_player_multiplier);
								//scr_increase_multiplyer(2,5);
								//scr_decrease_multiplyer(2,4);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(2,5);
						break;
						case 3: obj_game.player3_score += ((obj_game.score_eight*7)*_player_multiplier);
								//scr_increase_multiplyer(3,5);
								//scr_decrease_multiplyer(3,4);
						break;
						case 4: obj_game.player4_score += ((obj_game.score_eight*7)*_player_multiplier);
								//scr_increase_multiplyer(4,5);
								//scr_decrease_multiplyer(4,4);
						break;
					}
					_inst_points = obj_game.score_eight;
			break;
			case 9: 
					switch(player_number){
						case 1: obj_game.player1_score += ((obj_game.score_nine*8)*_player_multiplier);
								//scr_increase_multiplyer(1,6);
								//scr_decrease_multiplyer(1,5);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(1,6);
						break;
						case 2: obj_game.player2_score += ((obj_game.score_nine*8)*_player_multiplier);
								//scr_increase_multiplyer(2,6);
								//scr_decrease_multiplyer(2,5);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(2,6);
						break;
						case 3: obj_game.player3_score += ((obj_game.score_nine*8)*_player_multiplier);
								//scr_increase_multiplyer(3,6);
								//scr_decrease_multiplyer(3,5);
						break;
						case 4: obj_game.player4_score += ((obj_game.score_nine*8)*_player_multiplier);
								//scr_increase_multiplyer(4,6);
								//scr_decrease_multiplyer(4,5);
						break;
					}
					_inst_points = obj_game.score_nine;
			break;
			case 10: 
					switch(player_number){
						case 1: obj_game.player1_score += ((obj_game.score_ten*9)*_player_multiplier);
								//scr_increase_multiplyer(1,7);
								//scr_decrease_multiplyer(1,6);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(1,7);
						break;
						case 2: obj_game.player2_score += ((obj_game.score_ten*9)*_player_multiplier);
								//scr_increase_multiplyer(2,7);
								//scr_decrease_multiplyer(2,6);
								if (obj_game.sbvs == true) scr_increase_player_items_queued(2,7);
						break;
						case 3: obj_game.player3_score += ((obj_game.score_ten*9)*_player_multiplier);
								//scr_increase_multiplyer(3,7);
								//scr_decrease_multiplyer(3,6);
						break;
						case 4: obj_game.player4_score += ((obj_game.score_ten*9)*_player_multiplier);
								//scr_increase_multiplyer(4,7);
								//scr_decrease_multiplyer(4,6);
						break;
					}
					_inst_points = obj_game.score_ten;
			break;
		}
		*/
		#endregion
			
		#region Instance Scoring Method 2
		//scr_score_increase(_qty_inst_score,_player_multiplier,_inst_points);
		//apply the score to the correct player
		//the last item (one you are holding) will be scored separately if there is a bonus, so scores are multiplied by 1 less than in the collection
		switch(player_number){
			case 1: obj_game.player1_score += ((obj_game.score_inst_value[_qty_inst_score]*(_qty_inst_score-1))*_player_multiplier);
					if (obj_game.sbvs == true) and (_qty_inst_score > 3) scr_increase_player_items_queued(1,_qty_inst_score-3);
			break;
			case 2: obj_game.player2_score += ((obj_game.score_inst_value[_qty_inst_score]*(_qty_inst_score-1))*_player_multiplier);
					if (obj_game.sbvs == true) and (_qty_inst_score > 3) scr_increase_player_items_queued(2,_qty_inst_score-3);
			break;
			case 3: obj_game.player3_score += ((obj_game.score_inst_value[_qty_inst_score]*(_qty_inst_score-1))*_player_multiplier);
			break;
			case 4: obj_game.player4_score += ((obj_game.score_inst_value[_qty_inst_score]*(_qty_inst_score-1))*_player_multiplier);
			break;
		}
		//save how much each instance should display on their score card
		_inst_points = obj_game.score_inst_value[_qty_inst_score];
		
		
		#endregion
		
		//update remaining lines for Marathon mode (as long as you're not in a tutorial room)
		//if ((obj_game.game_type == MARATHON) and (room != rm_1P_level_00) and (room != rm_2P_level_00)) obj_game.remaining_lines--;
		//update total lines
		if ((obj_game.game_type == MARATHON) and (room != rm_1P_level_00) and (room != rm_2P_level_00)){
			obj_game.lines_this_level++;
			switch(player_number){
				case 1:	obj_game.total_lines_p1++ break;
				case 2: obj_game.total_lines_p2++ break;
			}
		}
		
		//find out how many instances in each scoring direction
		switch(_dir_enum){
			case HORIZONTAL: break;	
			case VERTICAL: break;
			case DIAGONAL_BS: break;
			case DIAGONAL_FS: break;
		}
		
		
		//destroy the instances in the array
		for (var i=1; i<_dir_counter; i++){
			var _scored_inst = _dir_id_array[i];
			//create score card
			var _inst_score_card = instance_create_layer(_scored_inst.x,_scored_inst.y,"Instances_1",obj_score_card);
			
			
			
			//add current modifier
			switch(player_number){
				case 1: 
					_inst_score_card.my_score = _inst_points*_player_multiplier; 
					if (obj_game.game_type == COLOR_CLASH) var _inst_color_card = instance_create_layer(_scored_inst.x,_scored_inst.y,"Player_backgrounds",obj_player1_background);
				break;
				case 2: 
					_inst_score_card.my_score = _inst_points*_player_multiplier; 
					if (obj_game.game_type == COLOR_CLASH) var _inst_color_card = instance_create_layer(_scored_inst.x,_scored_inst.y,"Player_backgrounds",obj_player2_background);
				break;
				case 3: _inst_score_card.my_score = _inst_points*_player_multiplier; break;
				case 4: _inst_score_card.my_score = _inst_points*_player_multiplier; break;
			}
			obj_game.remaining_items--;
			
			//activate a special power
			if (_scored_inst.special_power == FROZEN){
				
				switch(player_number){
					case 1: 
						scr_apply_power_frozen(obj_player2,obj_player3,obj_player4);
					break;
					case 2: 
						scr_apply_power_frozen(obj_player1,obj_player3,obj_player4);
					break;
					case 3: 
						scr_apply_power_frozen(obj_player1,obj_player2,obj_player4);
					break;
					case 4: 
						scr_apply_power_frozen(obj_player1,obj_player2,obj_player3);
					break;
					}
				
			}
			//pass the number of quantity in the collection back to the scored object in the array and the one the player is holding
			_scored_inst.my_collection_qty = _dir_counter;
			instance_holding_id.my_collection_qty = _dir_counter;
			
			//pass back score direction to the original instances
			//all other pieces in the collection (array prob not needed since multiple directions not an issue with other line items)
			//_scored_inst.my_score_direction = _dir_enum;
			array_push(_scored_inst.my_score_direction_array,_dir_enum);
			
			//held instance (middle piece that the player is holding
			//instance_holding_id.my_score_direction = _dir_enum;
			array_push(instance_holding_id.my_score_direction_array,_dir_enum);
			
			//screen shake based on size of largest collection
			var _shake = min(_dir_counter, 10);
			scr_screen_shake(_shake,_shake*2);
			
			//destroy the scored instance
			instance_destroy(_scored_inst);		
		}
			
	}
	
	return _inst_points;
}