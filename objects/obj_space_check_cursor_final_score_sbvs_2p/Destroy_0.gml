//increase score for p2 in split board mode
if (obj_game.sbvs == true) and (obj_game.multiplayer_mode == MULTI_COMP){
	if (instance_exists(obj_player2) and obj_player2.knocked_out == false){
		obj_game.player2_score += final_level_score;
	}
}
			
//leave this out of the above condition to prevent a possible error
obj_game.level_free_space_bonus_score_sbvs_2p = final_level_score;