function scr_score_increase(_qty_inst_score,_player_multiplier,_inst_points){
	
	//score the items
		
			
	//apply the score to the correct player
	//the last item (one you are holding) will be scored separately if there is a bonus, so scores are multiplied by 1 less than in the collection
	switch(player_number){
		case 1: obj_game.player1_score += ((obj_game.score_inst_value[_qty_inst_score]*_qty_inst_score)*_player_multiplier);
		break;
		case 2: obj_game.player2_score += ((obj_game.score_inst_value[_qty_inst_score]*_qty_inst_score)*_player_multiplier);
		break;
		case 3: obj_game.player3_score += ((obj_game.score_inst_value[_qty_inst_score]*_qty_inst_score)*_player_multiplier);
		break;
		case 4: obj_game.player4_score += ((obj_game.score_inst_value[_qty_inst_score]*_qty_inst_score)*_player_multiplier);
		break;
	}
	//save how much each instance should display on their score card
	_inst_points = obj_game.score_inst_value[_qty_inst_score];
		
	
}