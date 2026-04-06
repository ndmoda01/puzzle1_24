///@arg multiplayer_mode
///@arg game_type
///@arg number_of_players
///@arg max_entries

function scr_high_score_adjust_single_coop(argument0,argument1,argument2,argument3){

	var _multiplayer_mode = argument0;
	var _game_type = argument1;
	var _numb_of_players = argument2;
	var _max_entries = argument3;
	
	switch(_multiplayer_mode){
		
			
			case SINGLE_PLAYER:
				//check for score placement, set it and create the selectors for each player if needed
				//check to see which place the new score will be, add it, then adjust the previous scores
				//1st place
				//only need to check and adjust high scores once
				if (player1_score_adjusted == false){
					//run through the high score array
					for (var i=1; i <= _max_entries; i++){
				
						//see if the player's score is higher than all entries, starting higest to lowest
						if (player1_score > high_score_array[_game_type,i]){	
		
							//adjust scores to be one rank lower, loop through and copy as lower rank
							for (var j = _max_entries; j > i; j--){
								//start at the bottom score	
								//score number
								high_score_array[_game_type,j] = high_score_array[_game_type, j-1];
								//initals
								high_score_array[_game_type,j+10] = high_score_array[_game_type, j+9];	
							}
							//add player in the new spot
							high_score_array[_game_type, i] = player1_score;
							player1_rank = i;
							player1_score_adjusted = true;
							exit;
						}
					}
				}
				//update initials when finished
				if (registration_completed == true){
						if (instance_exists(obj_high_score_letter_selector_player1)){
							high_score_array[_game_type, player1_rank+10] = scr_delete_space_initials(obj_high_score_letter_selector_player1.initial);
						}
				}
			break;
			
			case MULTI_COOP:
				if (player1_score_adjusted == false){
					
					switch(_numb_of_players){
						case 2: coop_score = player1_score + player2_score;
						break;
						case 3: coop_score = player1_score + player2_score+player3_score;
						break;
						case 4: coop_score = player1_score + player2_score+player3_score+player4_score;
						break;
					}
					
					//run through the high score array
					for (var i=1; i <= _max_entries; i++){
						//see if the player's score is higher than all entries, starting higest to lowest
						if (coop_score > high_score_array[_game_type,i]){	
							//adjust scores to be one rank lower, loop through and copy as lower rank
							for (var j = _max_entries; j > i; j--){
								//start at the bottom score	
								//score number
								high_score_array[_game_type,j] = high_score_array[_game_type, j-1];
								//initals
								high_score_array[_game_type,j+10] = high_score_array[_game_type, j+9];	
							}
							//add player in the new spot
							high_score_array[_game_type, i] = coop_score;
							player1_rank = i;
							player1_score_adjusted = true;
							exit;
						}
					}
				}
				//update initials when finished
				if (registration_completed == true){
						if (instance_exists(obj_high_score_letter_selector_player1)){
							high_score_array[_game_type, player1_rank+10] = scr_delete_space_initials(obj_high_score_letter_selector_player1.initial);
						}
				}
			break;
	}
}