///@arg game_type
///@arg player_number (which player is it)
///@arg max_entries

function scr_high_score_adjust_comp(argument0,argument1,argument2){

	var _game_type = argument0;
	var _player_number = argument1;
	var _max_entries = argument2;
	var _score = 0;
	var _del_instance = noone;
	
	switch(_player_number){
		case 1: 
			_score = player1_score;
			if (instance_exists(obj_high_score_letter_selector_player1)){
				_del_instance = obj_high_score_letter_selector_player1.id;
			}
			
			//check for score placement, set it and create the selectors for each player if needed
			//check to see which place the new score will be, add it, then adjust the previous score
			//only need to check and adjust high scores once
			if (player1_score_adjusted == false){
				//run through the high score array
				for (var i=1; i <= _max_entries; i++){
				
					//see if the player's score is higher than all entries, starting higest to lowest
					if (_score > high_score_array[_game_type,i]){	
	
						//adjust scores to be one rank lower, loop through and copy as lower rank
						for (var j = _max_entries; j > i; j--){
							//start at the bottom score	
							//score number
							high_score_array[_game_type,j] = high_score_array[_game_type, j-1];
							//initals
							high_score_array[_game_type,j+10] = high_score_array[_game_type, j+9];							
						}
						
						//add player in the new spot
						high_score_array[_game_type, i] = _score;
						player1_rank = i;
						player1_score_adjusted = true;
						exit;
					}
				}
			}
			//update initials when finished
			if (registration_completed == true){
					if (instance_exists(_del_instance)){
						//run through the high score array
						for (var ii=1; ii <= _max_entries; ii++){
				
							//see if the player's score is higher than all entries, starting higest to lowest
							if (_score >= high_score_array[_game_type,ii]){	
								high_score_array[_game_type, ii+10] = scr_delete_space_initials(_del_instance.initial);
								exit;
							}
						}
					}
			}
		break;
		case 2:
			_score = player2_score;
			if (instance_exists(obj_high_score_letter_selector_player2)){
				_del_instance = obj_high_score_letter_selector_player2.id;
			}
			//check for score placement, set it and create the selectors for each player if needed
			//check to see which place the new score will be, add it, then adjust the previous scores
			//only need to check and adjust high scores once
			if (player2_score_adjusted == false){
				//run through the high score array
				for (var i=1; i <= _max_entries; i++){
				
					//see if the player's score is higher than all entries, starting higest to lowest
					if (_score > high_score_array[_game_type,i]){	
		
						//adjust scores to be one rank lower, loop through and copy as lower rank
						for (var j = _max_entries; j > i; j--){
							//start at the bottom score	
							//score number
							high_score_array[_game_type,j] = high_score_array[_game_type, j-1];
							//initals
							high_score_array[_game_type,j+10] = high_score_array[_game_type, j+9];						
						}
						
						//add player in the new spot
						high_score_array[_game_type, i] = _score;
						player2_rank = i;
						player2_score_adjusted = true;
						exit;
					}
				}
			}
			//update initials when finished
			if (registration_completed == true){
					if (instance_exists(_del_instance)){
						//run through the high score array
						for (var ii=1; ii <= _max_entries; ii++){
							//see if the player's score is higher than all entries, starting higest to lowest
							if (_score >= high_score_array[_game_type,ii]){	
								high_score_array[_game_type, ii+10] = scr_delete_space_initials(_del_instance.initial);
								exit;
							}
						}
					}
			}
		break;
		case 3:
			_score = player3_score;
			if (instance_exists(obj_high_score_letter_selector_player3)){
				_del_instance = obj_high_score_letter_selector_player3.id;
			}
			//check for score placement, set it and create the selectors for each player if needed
			//check to see which place the new score will be, add it, then adjust the previous scores
			//only need to check and adjust high scores once
			if (player3_score_adjusted == false){
				//run through the high score array
				for (var i=1; i <= _max_entries; i++){
				
					//see if the player's score is higher than all entries, starting higest to lowest
					if (_score > high_score_array[_game_type,i]){	

						//adjust scores to be one rank lower, loop through and copy as lower rank
						for (var j = _max_entries; j > i; j--){
							//start at the bottom score	
							//score number
							high_score_array[_game_type,j] = high_score_array[_game_type, j-1];
							//initals
							high_score_array[_game_type,j+10] = high_score_array[_game_type, j+9];	
						}
						
						//add player in the new spot
						high_score_array[_game_type, i] = _score;
						player3_rank = i;
						player3_score_adjusted = true;
						exit;
					}
				}
			}
			//update initials when finished
			if (registration_completed == true){
					if (instance_exists(_del_instance)){
						
						//run through the high score array
						for (var ii=1; ii <= _max_entries; ii++){
							//see if the player's score is higher than all entries, starting higest to lowest
							if (_score >= high_score_array[_game_type,ii]){	
								high_score_array[_game_type, ii+10] = scr_delete_space_initials(_del_instance.initial);
								exit;
							}
						}
					}
			}
		break;
		case 4:
			_score = player4_score;
			if (instance_exists(obj_high_score_letter_selector_player4)){
				_del_instance = obj_high_score_letter_selector_player4.id;
			}
			//check for score placement, set it and create the selectors for each player if needed
			//check to see which place the new score will be, add it, then adjust the previous scores
			//only need to check and adjust high scores once
			if (player4_score_adjusted == false){
				//run through the high score array
				for (var i=1; i <= _max_entries; i++){
					//see if the player's score is higher than all entries, starting higest to lowest
					if (_score > high_score_array[_game_type,i]){	
						//adjust scores to be one rank lower, loop through and copy as lower rank
						for (var j = _max_entries; j > i; j--){
							//start at the bottom score	
							//score number
							high_score_array[_game_type,j] = high_score_array[_game_type, j-1];
							//initals
							high_score_array[_game_type,j+9] = high_score_array[_game_type, j+9];	
						}
						
						//add player in the new spot
						high_score_array[_game_type, i] = _score;
						player4_rank = i;
						player4_score_adjusted = true;
						exit;
					}
				}
			}
			//update initials when finished
			if (registration_completed == true){
					if (instance_exists(_del_instance)){
						//run through the high score array
						for (var ii=1; ii <= _max_entries; ii++){
							//see if the player's score is higher than all entries, starting higest to lowest
							if (_score >= high_score_array[_game_type,ii]){	
								high_score_array[_game_type, ii+10] = scr_delete_space_initials(_del_instance.initial);
								exit;
							}
						}
					}
			}
		break;
	}
}