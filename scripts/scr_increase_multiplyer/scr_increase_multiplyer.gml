///@ARG player#
///@ARG increase_amount
///@DESCRIPTION

function scr_increase_multiplyer(argument0,argument1){
	
	var _player_number = argument0;
	var _multiplyer_increase = argument1;
	var _multiplyer_max = 10;
	//var _multiplyer_max = 99;
	
	switch(_player_number){
		case 1: obj_game.player1_score_modifier = min(obj_game.player1_score_modifier+_multiplyer_increase, _multiplyer_max);
		break;
		case 2: obj_game.player2_score_modifier = min(obj_game.player2_score_modifier+_multiplyer_increase, _multiplyer_max);
		break;
		case 3: obj_game.player3_score_modifier = min(obj_game.player3_score_modifier+_multiplyer_increase, _multiplyer_max);
		break;
		case 4: obj_game.player4_score_modifier = min(obj_game.player4_score_modifier+_multiplyer_increase, _multiplyer_max);
		break;
		
		
	}

}