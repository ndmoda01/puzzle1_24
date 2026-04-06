//add your total score
//doesn't make sense to add the same score to all players bc it essentially is meaningless
if (obj_game.multiplayer_mode != MULTI_COMP){
	// prob no need to add the bonus score multiple times?
	// also prob no need to add to player scores that aren't playing
	
	//divide final score in coop mode to prevent bonus from adding twice
	if (obj_game.multiplayer_mode == MULTI_COOP) final_level_score = final_level_score/2;
	
	obj_game.player1_score += final_level_score;
	obj_game.player2_score += final_level_score;
	obj_game.player3_score += final_level_score;
	obj_game.player4_score += final_level_score;
}

//increase score for p1 in split board mode
if (obj_game.sbvs == true) and (obj_game.multiplayer_mode == MULTI_COMP){
	if (instance_exists(obj_player1) and obj_player1.knocked_out == false){
		obj_game.player1_score += final_level_score;
	}
}
			
//leave this out of the condition to prevent a possible error
obj_game.level_free_space_bonus_score = final_level_score;