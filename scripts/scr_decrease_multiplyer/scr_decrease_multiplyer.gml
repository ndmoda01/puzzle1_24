///@arg player_number
///@ARG decrease_amount
///@DESCRIPTION

function scr_decrease_multiplyer(argument0,argument1){
	
	//exit script unless in multiplayer mode
	if (obj_game.multiplayer_mode != MULTI_COMP) exit;
	
	var _player_number = argument0;
	var _multiplier_decrease = argument1;
	var _multiplier_min = 1;
	
	switch(_player_number){
		case 1: 
			if (instance_exists(obj_player2)){
				obj_game.player2_score_modifier = max(obj_game.player2_score_modifier-_multiplier_decrease, _multiplier_min);
			}
			if (instance_exists(obj_player3)){
				obj_game.player3_score_modifier = max(obj_game.player3_score_modifier-_multiplier_decrease, _multiplier_min);
			}
			if (instance_exists(obj_player4)){
				obj_game.player4_score_modifier = max(obj_game.player4_score_modifier-_multiplier_decrease, _multiplier_min);
			}
			
		break;
		case 2:
			if (instance_exists(obj_player1)){
				obj_game.player1_score_modifier = max(obj_game.player1_score_modifier-_multiplier_decrease, _multiplier_min);
			}
			if (instance_exists(obj_player3)){
				obj_game.player3_score_modifier = max(obj_game.player3_score_modifier-_multiplier_decrease, _multiplier_min);
			}
			if (instance_exists(obj_player4)){
				obj_game.player4_score_modifier = max(obj_game.player4_score_modifier-_multiplier_decrease, _multiplier_min);
			}
		
		break;
		case 3: 
			if (instance_exists(obj_player1)){
				obj_game.player1_score_modifier = max(obj_game.player1_score_modifier-_multiplier_decrease, _multiplier_min);
			}
			if (instance_exists(obj_player2)){
				obj_game.player2_score_modifier = max(obj_game.player2_score_modifier-_multiplier_decrease, _multiplier_min);
			}
			if (instance_exists(obj_player4)){
				obj_game.player4_score_modifier = max(obj_game.player4_score_modifier-_multiplier_decrease, _multiplier_min);
			}
		break;
		case 4: 
			if (instance_exists(obj_player1)){
				obj_game.player1_score_modifier = max(obj_game.player1_score_modifier-_multiplier_decrease, _multiplier_min);
			}
			if (instance_exists(obj_player2)){
				obj_game.player2_score_modifier = max(obj_game.player2_score_modifier-_multiplier_decrease, _multiplier_min);
			}
			if (instance_exists(obj_player3)){
				obj_game.player3_score_modifier = max(obj_game.player3_score_modifier-_multiplier_decrease, _multiplier_min);
			}
		break;
		
		
	}


	

}